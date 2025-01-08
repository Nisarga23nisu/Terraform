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
    instance_type = var.instance-type
    tags = {
        name = "Web-server-1"
    }
}

resource "aws_instance" "ec2-2"{
    ami = var.ami-id
    instance_type = var.instance-type
    tags = {
        name = "Web-server-2"
    }
}
