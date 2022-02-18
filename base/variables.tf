/*
 * Terraform Base Mod
 * Author: Andrei Marinescu
 */

variable "main_common_name" {
  type        = string
  description = "The common name for the main ACM certificate"
}
variable "hosted_zone" {
  type        = string
  description = "The Route53 hosted zone ID to use"
}
variable "main_alternate_names" {
  type        = list(string)
  description = "Alternate FQDNs to include in the ACM certificate"
}

variable "ecr_name_prefix" {
  type        = string
  description = "Prefix for ECR repository names"
}
