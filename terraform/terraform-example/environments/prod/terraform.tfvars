aws_region = "us-west-2"
vpc_name = "prod-vpc"
vpc_cidr_block = "10.0.0.0/16"
instance_type = "t2.micro"
tags = {
  Environment = "prod"
  Project     = "example-terraform-aws"
}
