variable "remote_state_bucket_name" {
  type        = string
  description = "The name of the S3 bucket where Terraform state is be stored"
}

variable "remote_state_key" {
  type        = string
  default     = "eks-tfstate"
  description = "The key of the S3 bucket object where the EKS root module state is stored"
}

variable "remote_state_region" {
  type        = string
  description = "The region of the S3 bucket where the Terraform state is stored"
}

variable "dev_acm_cert_arn" {
  type        = string
  description = "The ARN of the ACM certificate used for the HTTPS listener of the dev endpoint"
}

variable "prod_acm_cert_arn" {
  type        = string
  description = "The ARN of the ACM certificate used for the HTTPS listener of the prod endpoint"
}

variable "dev_container_image" {
  type        = string
  description = "The Docker image to use for the dev endpoint"
}

variable "dev_container_port" {
  type        = string
  description = "The port to expose the dev endpoint on"
}

variable "prod_container_image" {
  type        = string
  description = "The Docker image to use for the prod endpoint"
}

variable "prod_container_port" {
  type        = string
  description = "The port to expose the prod endpoint on"
}

variable "staging_container_image" {
  type        = string
  description = "The Docker image to use for the staging endpoint"
}
variable "staging_container_port" {
  type        = string
  description = "The port to expose the staging endpoint on"
}
variable "staging_acm_cert_arn" {
  type        = string
  description = "The ARN of the ACM certificate used for the HTTPS listener of the staging endpoint"
}
