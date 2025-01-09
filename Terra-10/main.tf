provider "aws" {
   region = "ap-south-1"
   
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0fd05997b4dff7aac"
   instance_type =  "t2.micro"
   count = 1

   tags = {
           Name = "Terraform EC2"
   }

}

locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 80
      description = "Ingree rules for port 80"
   }]
}

resource "aws_security_group" "main" {
   name   = "resource_with_dynamic_block"
   vpc_id = "vpc-0cbb878d0b012b80c"

   dynamic "ingress" {
      for_each = local.ingress_rules

      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }

   tags = {
      Name = "AWS security group dynamic block"
   }
}