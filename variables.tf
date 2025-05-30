variable "aws_region" {
  default = "us-east-1"
}

variable "instence_type" {
  default = "t2.micro"
}

variable "key_pair" {
  description = "key_name"
}

variable "private_key_path" {
  description = "/home/akash-aj/Terraform/SCP/ec2_key.pem"
}

