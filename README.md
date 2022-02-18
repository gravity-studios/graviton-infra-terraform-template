# Graviton Terraform AWS EKS Template

`Terraform` HCL files for provisioning AWS infrastructure:

- AWS EKS cluster
- IAM roles and policies
- ACM certificates for all SSL load balancers as well as CloudFront Distributions
- MongoDB cluster provisioning per environment
- Kubernetes deployments for backend containers
- ECR repositories for CI/CD integration
- CloudWatch based logging via Fluent Bit
- VPC provisioning
- S3+CloudFront front-end hosting
- Route53 integration (TODO)
- ElastiCache Redis clusters (TODO)
- RDS relational DBMS (TODO)

## Prerequisites

In order to use these Terraform HCL files, you will need to have the following environment variables set:

````
export AWS_ACCESS_KEY_ID='<your-access-key-id>'
export AWS_SECRET_ACCESS_KEY='<your-secret-access-key>'
export AWS_DEFAULT_REGION='<your-default-region>'
export MONGODB_ATLAS_PUBLIC_KEY='<your-mongodb-atlas-public-key>'
export MONGODB_ATLAS_PRIVATE_KEY='<your-mongodb-atlas-private-key>'
````

You will also require Terraform `0.14.5`. Using `terraenv` and `direnv` to manage these environment variables is 
recommended.

## Module manifest & descriptions

- `base` 
  - SSL certificate provisioning
  - ECR repositories provisioning
  - S3 buckets provisioning for frontend hosting
  - CloudFront distributions linked to each S3 bucket
- `provision-eks` 
  - EKS cluster provisioning
  - Amazon Kubernetes Load Balancer Controller add-on
  - FluentBit addon for CloudWatch logging
  - VPC provisioning
  - IAM roles for EKS management
  - KMS management for EKS encryption
- `mongodb` 
  - mongoDB clusters provisioning
  - automatic peering w/ VPC created in `provision-eks`
- `deployments` 
  - Backend deployment strategy & EKS definitions


## Provisioning steps

Each module is designed to isolate different types of resources, in order to make maintenance of the infrastructure
easier and less error-prone.

The tfstates of each of the root modules are connected via S3 backed remote state sources. A module cannot write to 
the tfstate of a different module, it can only read from it.

A `terraform.tfvars.example` file is provided for each module. Rename it to `terraform.tfvars` and add the appropriate
values to it. Each root module contains a `variables.tf` file which contains descriptions of the variables.

Create the infrastructure by applying each module sequentially, in the following order:

- Step 1 - base
- Step 2 - provision-eks
- Step 3 - mongodb
- Step 4 - deployments

In order to apply each root module, you will need to run:
````bash
terraform init
terraform apply
````

## Procedure for adding new environment variables to the deployment definition

- add a new `env` entry to the `deployments/modules/k8s-container-service/main.tf` file
- declare the new variable in the `deployments/modules/k8s-container-service/variables.tf` file
- declare new `prod`, `staging` and `dev` flavours of the variable in the respective files in the `deployments` directory
- add the new variable to the module invocation in the `deployments/main.tf` file
- add the values to your `terraform.tfvars` file
- apply the configuration with `terraform apply`

## Current known issues

When applying the `deployments` module for the first time, the `terraform apply` command will fail saying that the 
ingress resource is null. This is a known issue and will be fixed in a future commit, the current workaround is to run 
`terraform apply` again, retrieving the correct output values.
