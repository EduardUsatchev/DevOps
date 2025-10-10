provider "aws" {
  region = "us-east-1"
}
module "jenkins" {
  source = "../../modules/jenkins"
  instance_type = "m5.8xlarge"
  env = "prod"

}