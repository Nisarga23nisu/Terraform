terraform {
    required_version = "~> 1.10.3"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "3.74.0"
        }
    }
}

provider "aws"{
    region = "ap-south-1"
}

resource "aws_instance" "main" {
    # bucket = "s3-bucket123"
    # ami = "i-0911bbb1de0a9889e"
    # instance_type =  "t2.micro"

}