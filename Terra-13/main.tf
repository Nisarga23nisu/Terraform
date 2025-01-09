locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 22
      description = "Ingree rules for port 80"
   }]
}

resource "aws_instance" "name" {
    ami = "ami-0fd05997b4dff7aac"
    instance_type = "t2.micro"
    key_name = "key"
    vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {
   
   

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
}
resource "aws_key_pair" "deployer"{
    key_name = "key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5wP4UCNmGFe1e04ZDTsnRFGcmDpox4s5ghRWrOozNF4J4BolQAuN1CCguEJ0S86EHsQxWTjCsJ+R4ZhHca8ewXMERZMa38Pxg++rrtFwS77d5auOoBGCUFT9gBBAl+5M576cjuKX9eS0Sf8vhBP3AF1nWoCy3sNsF9Pq6+MC2ZPTI6WqF0boMw6FFg6k54ZpVov7Yp7xs1XYcEl2Wipv4EKWzG/BviaM3VxCRH83PIXmbqC+0tnO+u0COpoXwAb/EjtbC+Hs5FmjPj7rCIOZtCKd+Kg5fZnjrKQDHtYru7NtfMX4zLGjxCpe6RkPj2O9ZDDleH+KIz9AfhzUe03KFOJaD+vzfomacmgeK2mR9Iddks/+9+3Gasyre/Yen1Qx6n3NJHjdkzi1gqAvYFCleE3u1IhJpC+XOemdVjp4ohJo1ECmaz/HYtn/Q7799DAe++DXGkigqW8oVRKkzbyWr8DrX3+4oy9Zjge3nG5jOFcv6JZUox6S5B8Id/Z3bKRc= student@4110024064967"
    }
