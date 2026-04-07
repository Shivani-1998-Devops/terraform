# Terraform configuration block
# Specifies required Terraform version and providers
terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# AWS provider configuration
# Configures the AWS region for resource deployment
provider "aws" {
  region = "ap-south-1"
}