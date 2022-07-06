terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # configure s3 as remote state storage
  backend "s3" {}
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

