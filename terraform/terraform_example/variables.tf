variable "aws_region" {
  description = "The AWS region to deploy to"
  type = string
  default = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {}
}























