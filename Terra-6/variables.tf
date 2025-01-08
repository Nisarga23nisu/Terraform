variable "ami-id" {
    description = "This is used to define ami-id"
    default = "ami-0fd05997b4dff7aac"
}

variable "instance-type"{
    type = map(any)
    default = {
        default = "t2.nano"
        dev = "t2.micro"
        prod = "t2.large"
    }
}

variable "aws-region"{
    default = "ap-south-1"
}

variable "aws-count" {
    default = 2
}