provider "aws" {
  region = "us-west-1"
}
module "jenkins" {
  source = "../../modules/jenkins"
  instance_type = "m4.large"
  env = "prod"

}