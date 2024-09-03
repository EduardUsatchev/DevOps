provider "aws" {
  region = "eu-central-1"
}
module "jenkins" {
  source = "../modules/jenkins"
  instance_type = "m5.4xlarge"
  env = "dev"

}