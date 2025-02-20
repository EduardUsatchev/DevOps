variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the EC2 instance"
  type        = string
}
variable "security_group_ids" {
  description = "List of security group IDs to associate with the instance"
  type        = list(string)
}
