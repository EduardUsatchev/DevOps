provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQ3EGUEWMQFCB2PXD"
  secret_key = "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"
}
module "jenkins" {
  source = "../../modules/jenkins"
  instance_type = "t2.micro"
  env = "dev"
}