variable "vpc_name" {
  description = "Name of the VPC"
  type = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {}
}
