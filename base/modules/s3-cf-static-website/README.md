## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.site_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_s3_bucket.site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cache_policy_id"></a> [cache\_policy\_id](#input\_cache\_policy\_id) | n/a | `string` | n/a | yes |
| <a name="input_cf_root_arn"></a> [cf\_root\_arn](#input\_cf\_root\_arn) | n/a | `string` | n/a | yes |
| <a name="input_cors_s3_policy_id"></a> [cors\_s3\_policy\_id](#input\_cors\_s3\_policy\_id) | n/a | `string` | n/a | yes |
| <a name="input_site_domain_name"></a> [site\_domain\_name](#input\_site\_domain\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_url"></a> [cloudfront\_url](#output\_cloudfront\_url) | n/a |
