module "vpc" {
  source = "./modules/vpc"
  aws_region = ""
  vpc_cidr    = var.vpc_cidr
  public_cidr = var.public_cidr
  private_cidr = var.private_cidr
}

module "security_group" {
  source = "./modules/security_group"
  aws_region = ""
  vpc_id = ""
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = ""
  instance_type = ""
  security_group_id = ""
  security_group_ids = []
  subnet_id = ""
}
