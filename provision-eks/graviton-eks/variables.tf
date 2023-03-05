variable "eks_cluster_name" {
  type        = string
  description = "Desired name for EKS cluster"
}

variable "vpc_name" {
  type        = string
  description = "Name of VPC"
}

variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "instance_type" {
  default     = "t2.small"
  description = "Instance type to use for K8S nodes"
}

variable "num_workers" {
  default     = "3"
  description = "Number of worker nodes to create"
}

variable "aws_eks_version" {
  default     = "1.24"
  description = "Kubernetes version to use in the EKS cluster"
}

variable "cluster_enabled_log_types" {
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  description = "A list of the desired control plane logging to enable"
}

# CONFIGMAP AWS-AUTH
variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap. "
  type        = list(string)
  default     = []
}
variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}
variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap. "
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}
