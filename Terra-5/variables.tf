variable "ami-id" {
    description = "This is used to define ami-id"
    default = "ami-0fd05997b4dff7aac"
}

variable "instance-type"{
    type = string
    default = "t2.micro"
}

variable "aws-region"{
    default = "ap-south-1"
}