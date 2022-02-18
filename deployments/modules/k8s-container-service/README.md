# K8S Deployment Task Definition Module
##### Author: Andrei Marinescu

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.nginx](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_ingress.alb-ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress) | resource |
| [kubernetes_namespace_v1.env_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [kubernetes_service.nginx](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_cert_arn"></a> [acm\_cert\_arn](#input\_acm\_cert\_arn) | n/a | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_app_url"></a> [app\_url](#input\_app\_url) | n/a | `any` | n/a | yes |
| <a name="input_app_url_build"></a> [app\_url\_build](#input\_app\_url\_build) | n/a | `any` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_client_redirect"></a> [client\_redirect](#input\_client\_redirect) | n/a | `any` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | n/a | `any` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | n/a | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | n/a | `string` | n/a | yes |
| <a name="input_eks_cluster_id"></a> [eks\_cluster\_id](#input\_eks\_cluster\_id) | n/a | `string` | n/a | yes |
| <a name="input_eks_region"></a> [eks\_region](#input\_eks\_region) | n/a | `string` | n/a | yes |
| <a name="input_instagram_client_id"></a> [instagram\_client\_id](#input\_instagram\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_instagram_client_secret"></a> [instagram\_client\_secret](#input\_instagram\_client\_secret) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_namespace"></a> [kubernetes\_namespace](#input\_kubernetes\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_linkedin_client_id"></a> [linkedin\_client\_id](#input\_linkedin\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_linkedin_client_secret"></a> [linkedin\_client\_secret](#input\_linkedin\_client\_secret) | n/a | `any` | n/a | yes |
| <a name="input_mongo_url"></a> [mongo\_url](#input\_mongo\_url) | n/a | `any` | n/a | yes |
| <a name="input_node_env"></a> [node\_env](#input\_node\_env) | n/a | `any` | n/a | yes |
| <a name="input_react_app_apikey"></a> [react\_app\_apikey](#input\_react\_app\_apikey) | n/a | `any` | n/a | yes |
| <a name="input_react_app_stripe_secret_key"></a> [react\_app\_stripe\_secret\_key](#input\_react\_app\_stripe\_secret\_key) | n/a | `any` | n/a | yes |
| <a name="input_react_app_url"></a> [react\_app\_url](#input\_react\_app\_url) | n/a | `any` | n/a | yes |
| <a name="input_react_app_url_magnify"></a> [react\_app\_url\_magnify](#input\_react\_app\_url\_magnify) | n/a | `any` | n/a | yes |
| <a name="input_redirect_url"></a> [redirect\_url](#input\_redirect\_url) | n/a | `any` | n/a | yes |
| <a name="input_rpc_host"></a> [rpc\_host](#input\_rpc\_host) | n/a | `any` | n/a | yes |
| <a name="input_rpc_pass"></a> [rpc\_pass](#input\_rpc\_pass) | n/a | `any` | n/a | yes |
| <a name="input_rpc_port"></a> [rpc\_port](#input\_rpc\_port) | n/a | `any` | n/a | yes |
| <a name="input_rpc_user"></a> [rpc\_user](#input\_rpc\_user) | n/a | `any` | n/a | yes |
| <a name="input_secret_code_jwt"></a> [secret\_code\_jwt](#input\_secret\_code\_jwt) | n/a | `any` | n/a | yes |
| <a name="input_sess_name"></a> [sess\_name](#input\_sess\_name) | n/a | `any` | n/a | yes |
| <a name="input_sess_secret"></a> [sess\_secret](#input\_sess\_secret) | n/a | `any` | n/a | yes |
| <a name="input_skip_preflight_check"></a> [skip\_preflight\_check](#input\_skip\_preflight\_check) | n/a | `any` | n/a | yes |
| <a name="input_twitter_consumer_key"></a> [twitter\_consumer\_key](#input\_twitter\_consumer\_key) | n/a | `any` | n/a | yes |
| <a name="input_twitter_consumer_secret"></a> [twitter\_consumer\_secret](#input\_twitter\_consumer\_secret) | n/a | `any` | n/a | yes |
| <a name="input_user_email"></a> [user\_email](#input\_user\_email) | n/a | `any` | n/a | yes |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | n/a | `any` | n/a | yes |
| <a name="input_vpc_public_subnets"></a> [vpc\_public\_subnets](#input\_vpc\_public\_subnets) | n/a | `list(string)` | n/a | yes |
| <a name="input_wallet_address"></a> [wallet\_address](#input\_wallet\_address) | n/a | `any` | n/a | yes |
| <a name="input_zoom_client_id"></a> [zoom\_client\_id](#input\_zoom\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_zoom_client_secret"></a> [zoom\_client\_secret](#input\_zoom\_client\_secret) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_ip"></a> [lb\_ip](#output\_lb\_ip) | FQDN of backend load balancer |
