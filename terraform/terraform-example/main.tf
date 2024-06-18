provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name = var.vpc_name
  cidr_block = var.vpc_cidr_block
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  instance_type = var.instance_type
}
