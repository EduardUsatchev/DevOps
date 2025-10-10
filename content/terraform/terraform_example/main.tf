
module "vpc" {
  source = "./modules/vpc"
  vpc_name = var.vpc_name
  cidr_block = var.vpc_cidr_block
  tags = var.tags
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  instance_type = var.instance_type
  subnet_id = "subnet-12345678" # Replace with actual subnet ID
  tags = var.tags
}

data "vault_generic_secret" "aws_credentials" {
  path = "secret/aws"  # Path in Vault where AWS credentials are stored
}

provider "aws" {
  region     = "us-west-2"
  access_key = data.vault_generic_secret.aws_credentials.data["access_key"]
  secret_key = data.vault_generic_secret.aws_credentials.data["secret_key"]
}

# Create AWS instances using count-based iteration
resource "aws_instance" "example" {
  count = length(local.instances)

  ami           = values(local.instances)[count.index]
  instance_type = "t2.micro"

  tags = {
    Name = "Instance-${count.index + 1}"
  }
}

