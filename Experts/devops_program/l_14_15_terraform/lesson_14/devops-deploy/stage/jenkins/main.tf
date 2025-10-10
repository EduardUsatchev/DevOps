provider "aws" {
  region = "us-west-2"
}
module "jenkins" {
  source = "../../modules/jenkins"
  instance_type = "m3.large"
  env = "stage"

}