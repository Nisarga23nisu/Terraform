resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket123353653"
  /*acl = "private"
  
  versioning {
    enabled = true  
  }*/

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}