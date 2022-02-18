variable "remote_state_bucket_name" {
  type        = string
  description = "The name of the S3 bucket where Terraform state is be stored"
}

variable "remote_state_key" {
  type        = string
  description = "The key of the S3 bucket object where the EKS root module state is stored"
}

variable "remote_state_region" {
  type        = string
  description = "The region of the S3 bucket where the Terraform state is stored"
}

variable "atlas_organization_id" {
  type        = string
  description = "The organization ID of the MongoDB Atlas account"
}

variable "mongo_region_name" {
  type        = string
  default     = "US_EAST_1"
  description = "The region name of the MongoDB cluster"
}

variable "dev_mongo_cluster_tier" {
  type        = string
  description = "The MongoDB cluster tier to use for the development MongoDB cluster"
}

variable "dev_mongo_master_user" {
  type        = string
  description = "The MongoDB username to use for the development MongoDB cluster"
}

variable "prod_mongo_cluster_tier" {
  type        = string
  description = "The MongoDB cluster tier to use for the production MongoDB cluster"
}

variable "prod_mongo_master_user" {
  type        = string
  description = "The MongoDB username to use for the production MongoDB cluster"
}
