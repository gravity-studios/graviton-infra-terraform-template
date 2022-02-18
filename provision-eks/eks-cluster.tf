resource "aws_kms_key" "eks" {
  description = "EKS Cluster Secret Encryption Key"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = local.cluster_name
  cluster_version = var.aws_eks_version

  manage_cluster_iam_resources = false
  manage_worker_iam_resources  = false
  cluster_iam_role_name        = aws_iam_role.cluster_role.name
  workers_role_name            = aws_iam_role.node_role.name
  enable_irsa                  = true

  # CLUSTER LOGGING
  cluster_enabled_log_types = var.cluster_enabled_log_types

  # CLUSTER ENCRYPTION
  cluster_encryption_config = [
    {
      provider_key_arn = aws_kms_key.eks.arn
      resources        = ["secrets"]
    }
  ]

  subnets = module.vpc.private_subnets
  vpc_id  = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group"
      instance_type                 = var.instance_type
      iam_instance_profile_name     = aws_iam_instance_profile.node_role_instance_profile.name
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      asg_desired_capacity          = var.num_workers
    }
  ]

  map_accounts = var.map_accounts
  map_users    = var.map_users
  map_roles    = var.map_roles

  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.cluster-AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.node-CloudWatchAgentServerPolicy,
  ]

}
