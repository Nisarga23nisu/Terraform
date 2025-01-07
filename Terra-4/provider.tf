terraform {
    backend "s3" {
        bucket = "s3statebackend123353653"
        dynamodb_table = "state-lock"
        key = "Users/Students/Documents/Terra-4.tfstate"
        region = "ap-south-1"
        encrypt = true
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}