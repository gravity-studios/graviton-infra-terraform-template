# MongoDB Atlas Provisioning Module
##### Author: Andrei Marinescu

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.20.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.1 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | ~> 1.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.0.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mongodb_dev"></a> [mongodb\_dev](#module\_mongodb\_dev) | ./mongo_environment | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [terraform_remote_state.eks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_atlas_organization_id"></a> [atlas\_organization\_id](#input\_atlas\_organization\_id) | The organization ID of the MongoDB Atlas account | `string` | n/a | yes |
| <a name="input_dev_mongo_cluster_tier"></a> [dev\_mongo\_cluster\_tier](#input\_dev\_mongo\_cluster\_tier) | The MongoDB cluster tier to use for the development MongoDB cluster | `string` | n/a | yes |
| <a name="input_dev_mongo_master_user"></a> [dev\_mongo\_master\_user](#input\_dev\_mongo\_master\_user) | The MongoDB username to use for the development MongoDB cluster | `string` | n/a | yes |
| <a name="input_mongo_region_name"></a> [mongo\_region\_name](#input\_mongo\_region\_name) | The region name of the MongoDB cluster | `string` | `"US_EAST_1"` | no |
| <a name="input_prod_mongo_cluster_tier"></a> [prod\_mongo\_cluster\_tier](#input\_prod\_mongo\_cluster\_tier) | The MongoDB cluster tier to use for the production MongoDB cluster | `string` | n/a | yes |
| <a name="input_prod_mongo_master_user"></a> [prod\_mongo\_master\_user](#input\_prod\_mongo\_master\_user) | The MongoDB username to use for the production MongoDB cluster | `string` | n/a | yes |
| <a name="input_remote_state_bucket_name"></a> [remote\_state\_bucket\_name](#input\_remote\_state\_bucket\_name) | The name of the S3 bucket where Terraform state is be stored | `string` | n/a | yes |
| <a name="input_remote_state_key"></a> [remote\_state\_key](#input\_remote\_state\_key) | The key of the S3 bucket object where the EKS root module state is stored | `string` | n/a | yes |
| <a name="input_remote_state_region"></a> [remote\_state\_region](#input\_remote\_state\_region) | The region of the S3 bucket where the Terraform state is stored | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dev_mongo_host"></a> [dev\_mongo\_host](#output\_dev\_mongo\_host) | Hostname of dev mongoDB cluster |
| <a name="output_dev_mongo_pass"></a> [dev\_mongo\_pass](#output\_dev\_mongo\_pass) | DB password of dev mongoDB cluster |
| <a name="output_dev_mongo_user"></a> [dev\_mongo\_user](#output\_dev\_mongo\_user) | DB username of dev mongoDB cluster |
