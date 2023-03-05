output "aws_account_id" {
  description = "AWS account ID used for provisioning resources"
  value = module.eks_main.aws_account_id
}
output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks_main.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks_main.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks_main.cluster_security_group_id
}

#output "config_map_aws_auth" {
#  description = "A kubernetes configuration to authenticate to this EKS cluster."
#  value       = module.eks.config_map_aws_auth
#}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "vpc_id" {
  value = module.eks_main.vpc_id
  description = "ID of the associated VPC"
}

output "vpc_cidr_block" {
  value = module.eks_main.vpc_cidr_block
  description = "CIDR block of the associated VPC"
}

output "public_subnets" {
  value = module.eks_main.public_subnets
  description = "Public Subnets associated to VPC"
}

output "eks_worker_sg" {
  value       = module.eks_main.node_security_group_id
  description = "EKS Workers Security Group"
}

output "public_route_table_ids" {
  value       = module.eks_main.public_route_table_ids
  description = "Public Route Table IDs"
}

output "private_route_table_ids" {
  value       = module.eks_main.private_route_table_ids
  description = "Public Route Table IDs"
}
