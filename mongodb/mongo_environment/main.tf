/*
 * MongoDB Atlas Provisioning Module
 * Author: Eduard Bulai, Andrei Marinescu
 */


resource "mongodbatlas_project" "project" {
  name   = "${var.environment}-clusters"
  org_id = var.atlas_organization_id
}

resource "mongodbatlas_cluster" "api_cluster" {
  project_id   = mongodbatlas_project.project.id
  name         = "mongo-${var.environment}-cluster"
  cluster_type = "REPLICASET"

  replication_factor           = 3
  cloud_backup                 = true
  auto_scaling_disk_gb_enabled = false
  mongo_db_major_version       = "4.2"

  //Provider Settings "block"
  provider_name = "AWS" # AWS for dedicated plan, TENANT for shared plan
  # backing_provider_name       = "AWS" # only for shared plans
  provider_instance_size_name = var.mongo_cluster_tier
  provider_region_name        = var.mongo_region_name
}

resource "mongodbatlas_database_user" "api_cluster_user" {
  username           = var.mongo_master_user
  password           = random_string.mongo_password.result
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

resource "mongodbatlas_network_peering" "api_cluster_peering" {
  accepter_region_name   = var.aws_region
  project_id             = mongodbatlas_project.project.id
  container_id           = mongodbatlas_cluster.api_cluster.container_id
  provider_name          = "AWS"
  route_table_cidr_block = var.vpc_cidr_block
  vpc_id                 = var.vpc_id
  aws_account_id         = var.aws_account_id
}

# the following assumes an AWS provider is configured
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = mongodbatlas_network_peering.api_cluster_peering.connection_id
  auto_accept               = true
}

resource "mongodbatlas_project_ip_access_list" "eks_tasks_sg" {
  project_id         = mongodbatlas_project.project.id
  aws_security_group = var.aws_security_group_id // data.terraform_remote_state.eks.outputs.eks_worker_sg
  comment            = "Allow the EKS workers security group to have access to MongoDB Atlas peering"

  depends_on = [mongodbatlas_network_peering.api_cluster_peering]
}

resource "random_string" "mongo_password" {
  length  = 32
  special = false
  number  = true
}

# Route to MongoDB Atlas peering
resource "aws_route" "private_subnet_mongodb_peer" {
  route_table_id = var.private_route_table_id
  # MongoDB Atlas subnet
  destination_cidr_block = "192.168.248.0/21"
  # Peering connection ID as gateway
  vpc_peering_connection_id = mongodbatlas_network_peering.api_cluster_peering.connection_id
  depends_on                = [mongodbatlas_network_peering.api_cluster_peering]
}

# Route to MongoDB Atlas peering
resource "aws_route" "public_subnet_mongodb_peer" {
  route_table_id = var.public_route_table_id
  # MongoDB Atlas subnet
  destination_cidr_block = "192.168.248.0/21"
  # Peering connection ID as gateway
  vpc_peering_connection_id = mongodbatlas_network_peering.api_cluster_peering.connection_id
  depends_on                = [mongodbatlas_network_peering.api_cluster_peering]
}

######## IMPORTANT!!! ########
# If not in development environment, delete this resource
# This opens up the mongodb cluster to everyone
##############################
# resource "mongodbatlas_project_ip_access_list" "all" {
#   project_id         = mongodbatlas_project.project.id
#   cidr_block         = "0.0.0.0/0"
#   comment            = "Allow all. DELETE THIS IN PRODUCTION!!!"
# }
