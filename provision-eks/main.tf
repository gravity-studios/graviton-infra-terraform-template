/*
 * # AWS EKS Provisioning Module
 * ##### Author: Andrei Marinescu
 */

terraform {
  backend "s3" {
    bucket = "test-graviton"
    key    = "eks-tfstate"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.0"
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
      version = ">= 2.17.0"
    }

    helm = {
      version = ">=2.8.0"
    }
  }

  required_version = ">= 1.0.0"
}

