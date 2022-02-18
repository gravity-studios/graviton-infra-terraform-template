/*
 * Terraform Base Mod
 * Author: Andrei Marinescu
 */

output "certificate_arn" {
  value = aws_acm_certificate.cert.arn
  description = "ARN of wildcard certificate created in the region targeted for deployment"
}

output "dev_ecr_repository_url" {
  value = aws_ecr_repository.ecr-dev.repository_url
  description = "URL of ECR repository for dev backend"
}

output "dev_ecr_registry_id" {
  value = aws_ecr_repository.ecr-dev.registry_id
  description = "ID of ECR repository for dev backend"
}

output "staging_ecr_repository_url" {
  value = aws_ecr_repository.ecr-staging.repository_url
  description = "URL of ECR repository for staging backend"
}

output "staging_ecr_registry_id" {
  value = aws_ecr_repository.ecr-staging.registry_id
  description = "ID of ECR repository for staging backend"
}

output "prod_ecr_repository_url" {
  value = aws_ecr_repository.ecr-prod.repository_url
  description = "URL of ECR repository for production backend"
}

output "prod_ecr_registry_id" {
  value = aws_ecr_repository.ecr-prod.registry_id
  description = "ID of ECR repository for production backend"
}

output "dev_frontend_1_url" {
  value = module.frontend_1.cloudfront_url
  description = "CF URL for frontend"
}

output "dev_frontend_2_url" {
  value = module.frontend_2.cloudfront_url
  description = "CF URL for second frontend"
}