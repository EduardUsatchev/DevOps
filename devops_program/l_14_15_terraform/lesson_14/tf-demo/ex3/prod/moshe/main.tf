provider "aws" {
  region = "eu-central-1"
}

module "web" {
  source = "../../modules/moshe"
  instance_type = "m5.2xlarge"
  ami_id = "ami-blabla"
}