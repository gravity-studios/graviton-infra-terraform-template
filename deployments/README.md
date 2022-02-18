# K8S Deployments Module
##### Author: Andrei Marinescu

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.20.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend_dev"></a> [backend\_dev](#module\_backend\_dev) | ./modules/k8s-container-service | n/a |
| <a name="module_backend_prod"></a> [backend\_prod](#module\_backend\_prod) | ./modules/k8s-container-service | n/a |
| <a name="module_backend_staging"></a> [backend\_staging](#module\_backend\_staging) | ./modules/k8s-container-service | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.eks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dev_acm_cert_arn"></a> [dev\_acm\_cert\_arn](#input\_dev\_acm\_cert\_arn) | The ARN of the ACM certificate used for the HTTPS listener of the dev endpoint | `string` | n/a | yes |
| <a name="input_dev_container_image"></a> [dev\_container\_image](#input\_dev\_container\_image) | The Docker image to use for the dev endpoint | `string` | n/a | yes |
| <a name="input_dev_container_port"></a> [dev\_container\_port](#input\_dev\_container\_port) | The port to expose the dev endpoint on | `string` | n/a | yes |
| <a name="input_dev_env_var_1"></a> [dev\_env\_var\_1](#input\_dev\_env\_var\_1) | n/a | `string` | `""` | no |
| <a name="input_dev_env_var_2"></a> [dev\_env\_var\_2](#input\_dev\_env\_var\_2) | n/a | `string` | `""` | no |
| <a name="input_prod_acm_cert_arn"></a> [prod\_acm\_cert\_arn](#input\_prod\_acm\_cert\_arn) | The ARN of the ACM certificate used for the HTTPS listener of the prod endpoint | `string` | n/a | yes |
| <a name="input_prod_container_image"></a> [prod\_container\_image](#input\_prod\_container\_image) | The Docker image to use for the prod endpoint | `string` | n/a | yes |
| <a name="input_prod_container_port"></a> [prod\_container\_port](#input\_prod\_container\_port) | The port to expose the prod endpoint on | `string` | n/a | yes |
| <a name="input_prod_env_var_1"></a> [prod\_env\_var\_1](#input\_prod\_env\_var\_1) | n/a | `string` | `""` | no |
| <a name="input_prod_env_var_2"></a> [prod\_env\_var\_2](#input\_prod\_env\_var\_2) | n/a | `string` | `""` | no |
| <a name="input_remote_state_bucket_name"></a> [remote\_state\_bucket\_name](#input\_remote\_state\_bucket\_name) | The name of the S3 bucket where Terraform state is be stored | `string` | n/a | yes |
| <a name="input_remote_state_key"></a> [remote\_state\_key](#input\_remote\_state\_key) | The key of the S3 bucket object where the EKS root module state is stored | `string` | `"eks-tfstate"` | no |
| <a name="input_remote_state_region"></a> [remote\_state\_region](#input\_remote\_state\_region) | The region of the S3 bucket where the Terraform state is stored | `string` | n/a | yes |
| <a name="input_staging_acm_cert_arn"></a> [staging\_acm\_cert\_arn](#input\_staging\_acm\_cert\_arn) | The ARN of the ACM certificate used for the HTTPS listener of the staging endpoint | `string` | n/a | yes |
| <a name="input_staging_container_image"></a> [staging\_container\_image](#input\_staging\_container\_image) | The Docker image to use for the staging endpoint | `string` | n/a | yes |
| <a name="input_staging_container_port"></a> [staging\_container\_port](#input\_staging\_container\_port) | The port to expose the staging endpoint on | `string` | n/a | yes |
| <a name="input_staging_env_var_1"></a> [staging\_env\_var\_1](#input\_staging\_env\_var\_1) | n/a | `string` | `""` | no |
| <a name="input_staging_env_var_2"></a> [staging\_env\_var\_2](#input\_staging\_env\_var\_2) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dev_lb_ip"></a> [dev\_lb\_ip](#output\_dev\_lb\_ip) | FQDN of dev backend load balancer |
| <a name="output_prod_lb_ip"></a> [prod\_lb\_ip](#output\_prod\_lb\_ip) | FQDN of production backend load balancer |
| <a name="output_staging_lb_ip"></a> [staging\_lb\_ip](#output\_staging\_lb\_ip) | FQDN of staging backend load balancer |
