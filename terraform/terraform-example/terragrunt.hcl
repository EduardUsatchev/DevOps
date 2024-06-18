remote_state {
  backend = "s3"
  config = {
    bucket = "your-terraform-state-bucket"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-west-2"
  }
}

terraform {
  source = "./../modules//${path_relative_to_include()}"
}
