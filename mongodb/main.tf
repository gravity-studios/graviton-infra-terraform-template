/*
 * # MongoDB Atlas Provisioning Module
 * ##### Author: Andrei Marinescu
 */

module "mongodb_dev" {
  source = "./mongo_environment"

  environment            = "dev"
  atlas_organization_id  = var.atlas_organization_id
  aws_account_id         = data.terraform_remote_state.eks.outputs.aws_account_id
  aws_region             = data.terraform_remote_state.eks.outputs.region
  aws_security_group_id  = data.terraform_remote_state.eks.outputs.eks_worker_sg
  vpc_id                 = data.terraform_remote_state.eks.outputs.vpc_id
  vpc_cidr_block         = data.terraform_remote_state.eks.outputs.vpc_cidr_block
  private_route_table_id = data.terraform_remote_state.eks.outputs.private_route_table_ids.0
  public_route_table_id  = data.terraform_remote_state.eks.outputs.public_route_table_ids.0
  mongo_region_name      = var.mongo_region_name
  mongo_cluster_tier     = var.dev_mongo_cluster_tier
  mongo_master_user      = var.dev_mongo_master_user

}

#module "mongodb_prod" {
#  source = "./mongo_environment"
#
#  environment = "prod"
#  atlas_organization_id = var.atlas_organization_id
#  aws_account_id = data.terraform_remote_state.eks.outputs.aws_account_id
#  aws_region = data.terraform_remote_state.eks.outputs.region
#  aws_security_group_id = data.terraform_remote_state.eks.outputs.eks_worker_sg
#  vpc_id = data.terraform_remote_state.eks.outputs.vpc_id
#  vpc_cidr_block = data.terraform_remote_state.eks.outputs.vpc_cidr_block
#  mongo_region_name = var.mongo_region_name
#  mongo_cluster_tier = var.dev_mongo_cluster_tier
#  mongo_master_user = var.dev_mongo_master_user
#}
