#Create a S3 bucket

resource "aws_s3_bucket" "mybucket" {
    bucket = "s3statebackend123353653"
    versioning {
        enabled = true  
    }
    server_side_encryption_configuration{
        rule {
                apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
            }
        }
    }
}

#create dynamodb

resource "aws_dynamodb_table" "statelock" {
    name             = "state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key         = "LockID"

    attribute {
        name = "LockID"
        type = "S"
  }
}
