# Terraform Base Mod
##### Author: Andrei Marinescu

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.74 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.74 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_frontend_1"></a> [frontend\_1](#module\_frontend\_1) | ./modules/s3-cf-static-website | n/a |
| <a name="module_frontend_2"></a> [frontend\_2](#module\_frontend\_2) | ./modules/s3-cf-static-website | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.domain_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_cache_policy.cors](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_cache_policy) | resource |
| [aws_cloudfront_origin_request_policy.cors_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_request_policy) | resource |
| [aws_ecr_repository.ecr-dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.ecr-prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.ecr-staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.ecr-dev-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_ecr_repository_policy.ecr-prod-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_ecr_repository_policy.ecr-staging-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_name_prefix"></a> [ecr\_name\_prefix](#input\_ecr\_name\_prefix) | Prefix for ECR repository names | `string` | n/a | yes |
| <a name="input_hosted_zone"></a> [hosted\_zone](#input\_hosted\_zone) | The Route53 hosted zone ID to use | `string` | n/a | yes |
| <a name="input_main_alternate_names"></a> [main\_alternate\_names](#input\_main\_alternate\_names) | Alternate FQDNs to include in the ACM certificate | `list(string)` | n/a | yes |
| <a name="input_main_common_name"></a> [main\_common\_name](#input\_main\_common\_name) | The common name for the main ACM certificate | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_arn"></a> [certificate\_arn](#output\_certificate\_arn) | ARN of wildcard certificate created in the region targeted for deployment |
| <a name="output_dev_ecr_registry_id"></a> [dev\_ecr\_registry\_id](#output\_dev\_ecr\_registry\_id) | ID of ECR repository for dev backend |
| <a name="output_dev_ecr_repository_url"></a> [dev\_ecr\_repository\_url](#output\_dev\_ecr\_repository\_url) | URL of ECR repository for dev backend |
| <a name="output_dev_frontend_1_url"></a> [dev\_frontend\_1\_url](#output\_dev\_frontend\_1\_url) | CF URL for frontend |
| <a name="output_dev_frontend_2_url"></a> [dev\_frontend\_2\_url](#output\_dev\_frontend\_2\_url) | CF URL for second frontend |
| <a name="output_prod_ecr_registry_id"></a> [prod\_ecr\_registry\_id](#output\_prod\_ecr\_registry\_id) | ID of ECR repository for production backend |
| <a name="output_prod_ecr_repository_url"></a> [prod\_ecr\_repository\_url](#output\_prod\_ecr\_repository\_url) | URL of ECR repository for production backend |
| <a name="output_staging_ecr_registry_id"></a> [staging\_ecr\_registry\_id](#output\_staging\_ecr\_registry\_id) | ID of ECR repository for staging backend |
| <a name="output_staging_ecr_repository_url"></a> [staging\_ecr\_repository\_url](#output\_staging\_ecr\_repository\_url) | URL of ECR repository for staging backend |
