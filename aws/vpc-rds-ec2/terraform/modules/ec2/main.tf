resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  vpc_security_group_ids = var.security_group_ids  # Ensure this matches
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
