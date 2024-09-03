provider "aws" {
  region = "us-east-1"
  access_key = "#######3"
  secret_key = "#######"
}
module "jenkins" {
  source = "../../modules/jenkins"
  instance_type = "t2.micro"
  env = "dev"
}