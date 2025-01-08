terraform {
    required_version = "~> 1.10.3"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "3.74.0"
      }
    }
}

provider "aws" {
    region = var.aws-region
}

resource "aws_instance" "ec2-1"{
    ami = var.ami-id
    instance_type = lookup(var.instance-type, terraform.workspace)
    tags = {
        name = "New-Instance-${terraform.workspace}"
    }
}