terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "example-terraform-aws/terraform.tfstate"
    region = "us-west-2"
  }
}
