resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_cidr
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr
}


provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  endpoints {
    ec2     = "http://localhost:4566"
    s3      = "http://localhost:4566"
    iam     = "http://localhost:4566"
    sts     = "http://localhost:4566"
    rds     = "http://localhost:4566"
  }
}
