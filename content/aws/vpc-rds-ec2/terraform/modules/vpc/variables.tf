variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}
variable "aws_region" {
  description = "AWS Region to deploy resources"
  type        = string
}
