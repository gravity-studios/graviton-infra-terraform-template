provider "aws" {
  region = local.region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.this.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}

data "aws_caller_identity" "current" {}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

data "aws_availability_zones" "available" {}

locals {
  name = var.eks_cluster_name
  region = var.region

  cluster_version = var.aws_eks_version

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Blueprint  = local.name
    PoweredBy = "EKS Graviton"
  }
}

################################################################################
# Cluster
################################################################################

#tfsec:ignore:aws-eks-enable-control-plane-logging
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.9"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true

  # create_aws_auth_configmap = true
  manage_aws_auth_configmap = true

  cluster_enabled_log_types = var.cluster_enabled_log_types

  aws_auth_users = var.map_users
  aws_auth_accounts = var.map_accounts
  aws_auth_roles = var.map_roles

  # EKS Addons
  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = {}
    # aws_load_balancer_controller = {}
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    initial = {
      instance_types = [var.instance_type]

      min_size     = 0
      max_size     = var.num_workers
      desired_size = var.num_workers
    }
  }

  tags = local.tags
}

################################################################################
# Kubernetes Addons
################################################################################

module "eks_blueprints_kubernetes_addons" {
  source = "./modules/kubernetes-addons"

  eks_cluster_id       = module.eks.cluster_name
  eks_cluster_endpoint = module.eks.cluster_endpoint
  eks_oidc_provider    = module.eks.oidc_provider
  eks_cluster_version  = module.eks.cluster_version

  # Add-ons
  enable_metrics_server     = true
  enable_cluster_autoscaler = true
  enable_aws_for_fluentbit = true
  enable_aws_load_balancer_controller = true
  eks_worker_security_group_id = module.eks.cluster_security_group_id

  tags = local.tags
}

