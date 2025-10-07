module "vpc" {
  source = "../../modules/vpc"
  vpc_name = "dev-vpc"
  cidr_block = "10.0.0.0/16"
}

module "ec2" {
  source = "../../modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_id = aws_subnet.main.id
  instance_type = "${TYPE}"
}

provider "aws" {
  region     = "us-west-2"
  access_key = data.vault_generic_secret.aws_credentials.data["access_key"]
  secret_key = data.vault_generic_secret.aws_credentials.data["secret_key"]
}