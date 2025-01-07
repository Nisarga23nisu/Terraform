resource "aws_instance" "web"{
   
    ami = "ami-0fd05997b4dff7aac"
    instance_type = "t2.micro"
    #security_groups = ["aws_security_group.TF_SG.name"]
    #count = 5    # 5 instance will be created
    tags = {
        Name = "Terraform EC2"
    }
}


# Security group using terraform 


resource "aws_security_group" "TF_SG" {
  name        = "Security group using terraform"
  description = "Security group using terraform "
  vpc_id      = "vpc-0cbb878d0b012b80c"

    ingress {
        description = "HTTP"    
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description = "HTTPS"    
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description = "SSH"    
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
  
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
    Name = "TF_SG"
  }
}



