# LB Ingress Controller Deployment Guide

# Introduction

AWS Load Balancer Controller is a controller to help manage Elastic Load Balancers for a Kubernetes cluster.

* It satisfies Kubernetes Ingress resources by provisioning Application Load Balancers.
* It satisfies Kubernetes Service resources by provisioning Network Load Balancers.

# Helm Chart

### Instructions to use Helm Charts

Add Helm repo for LB Ingress Controller

    helm repo add aws-load-balancer-controller https://aws.github.io/eks-charts

    https://github.com/aws/eks-charts/blob/master/stable/aws-load-balancer-controller/values.yaml

    https://artifacthub.io/packages/helm/aws/aws-load-balancer-controller


# Docker Image for LB ingress controller

###### Instructions to upload LB ingress controller Docker image to AWS ECR

Step1: Get the latest docker image from this link

        https://github.com/aws/eks-charts/blob/master/stable/aws-load-balancer-controller/values.yaml

Step2: Download the docker image to your local Mac/Laptop

        $ aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 602401143452.dkr.ecr.us-west-2.amazonaws.com

        $ docker pull 602401143452.dkr.ecr.us-west-2.amazonaws.com/amazon/aws-load-balancer-controller:v2.2.1

Step3: Retrieve an authentication token and authenticate your Docker client to your registry. Use the AWS CLI:

        $ aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin <account id>.dkr.ecr.eu-west-1.amazonaws.com

Step4: Create an ECR repo for LB ingress controller if you don't have one

        $ aws ecr create-repository \
              --repository-name amazon/aws-load-balancer-controller \
              --image-scanning-configuration scanOnPush=true

Step5: After the build completes, tag your image so, you can push the image to this repository:

        $ docker tag 602401143452.dkr.ecr.us-west-2.amazonaws.com/amazon/aws-load-balancer-controller:v2.2.1 <accountid>.dkr.ecr.eu-west-1.amazonaws.com/amazon/aws-load-balancer-controller:v2.2.1

Step6: Run the following command to push this image to your newly created AWS repository:

        $ docker push <accountid>.dkr.ecr.eu-west-1.amazonaws.com/amazon/aws-load-balancer-controller:v2.2.1


#### AWS Service annotations for LB Ingress Controller
Here is the link to get the AWS ELB [service annotations](https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/guide/service/annotations/) for LB Ingress controller


<!--- BEGIN_TF_DOCS --->
AWS EKS terraform module
Author: Eduard Bulai

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.eks_lb_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.eks_lb_controller_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.lb_ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.eks_lb_controller_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [aws_iam_policy_document.eks_lb_controller_assume_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eks_cluster_id"></a> [eks\_cluster\_id](#input\_eks\_cluster\_id) | EKS cluster Id | `string` | n/a | yes |
| <a name="input_eks_oidc_issuer_url"></a> [eks\_oidc\_issuer\_url](#input\_eks\_oidc\_issuer\_url) | The URL on the EKS cluster OIDC Issuer | `string` | n/a | yes |
| <a name="input_eks_oidc_provider_arn"></a> [eks\_oidc\_provider\_arn](#input\_eks\_oidc\_provider\_arn) | The ARN of the OIDC Provider if `enable_irsa = true`. | `string` | n/a | yes |
| <a name="input_lb_ingress_controller_helm_app"></a> [lb\_ingress\_controller\_helm\_app](#input\_lb\_ingress\_controller\_helm\_app) | Helm chart definition for lb\_ingress\_controller. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingress_name"></a> [ingress\_name](#output\_ingress\_name) | n/a |
| <a name="output_ingress_namespace"></a> [ingress\_namespace](#output\_ingress\_namespace) | n/a |

<!--- END_TF_DOCS --->
