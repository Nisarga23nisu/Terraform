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

##resource "aws_security_group" "allowing_ssh" {
  name        = "allowing_ssh"
  description = "allowing_ssh"

    ingress {
        description = "Inbound Traffic"    
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        description = "Outbound traffic"
        from_port        = 0
        to_port          = 65535
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    tags = {
    Name = "allowing_ssh"
    }
}###

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
