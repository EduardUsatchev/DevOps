aws_region = "us-west-2"
vpc_name = "dev-vpc"
vpc_cidr_block = "10.0.0.0/16"
instance_type = "t2.micro"
tags = {
  Environment = "dev"
  Project     = "example-terraform-aws"
}
