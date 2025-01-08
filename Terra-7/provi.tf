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

resource "aws_instance" "ec2-2"{
    ami = var.ami-id
    instance_type = var.instance-type
    key_name = "DevOps"
    tags = {
        "Name" = "Web-server2"
    }

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("./DevOps.pem")
      host = self.public_ip
      timeout = "2m"
    }

    provisioner "local-exec" {
        command = "echo ${aws_instance.ec2-2.private_ip} > private_ip.txt"
      
    }

    provisioner "remote-exec" {
        inline = [ 
            "sudo amazon-linux-extras install nginx1 -y",
            "sudo systemctl start nginx"
         ]
    }
}