/*
 * S3+CloudFront static website module
 * Author: Eduard Bulai, Andrei Marinescu
 */

variable "site_domain_name" {
  type = string
}
variable "cf_root_arn" {
  type = string
}
variable "cors_s3_policy_id" {
  type = string
}
variable "cache_policy_id" {
  type = string
}