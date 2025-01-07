resource "aws_instance" "web"{
   
    ami = "ami-0fd05997b4dff7aac"
    instance_type = "t2.micro"
    #security_groups = ["aws_security_group.TF_SG.name"]
    
    # First Method for key-pair
    # key_name = "Name"
    tags = {
        Name = "Terraform EC2"
    }
}

# Second method for Key-pair

resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}
# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}