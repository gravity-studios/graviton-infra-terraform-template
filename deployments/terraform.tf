terraform {
  backend "s3" {
    bucket = "<your-tf-s3-bucket>"
    key    = "deployments-tfstate"
    region = "us-east-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = var.remote_state_bucket_name
    key    = var.remote_state_key
    region = var.remote_state_region
  }
}
