variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {}
}
