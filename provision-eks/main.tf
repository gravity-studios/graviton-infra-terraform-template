/*
 * # AWS EKS Provisioning Module
 * ##### Author: Andrei Marinescu
 */

terraform {
  backend "s3" {
    bucket = "<your-tf-s3-bucket>"
    key    = "eks-tfstate"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }

    helm = {
      version = "1.2.0"
    }
  }

  required_version = ">= 0.14"
}

