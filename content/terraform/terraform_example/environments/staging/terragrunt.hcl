include {
  path = find_in_parent_folders()
}

terraform {
  extra_arguments "vars" {
    commands = get_terraform_commands_that_need_vars()
    optional_var_files = ["${get_parent_terragrunt_dir()}/terraform.tfvars"]
  }
}

inputs = {
  aws_region       = "us-west-2"
  vpc_name         = "staging-vpc"
  vpc_cidr_block   = "10.0.0.0/16"
  instance_type    = "t2.micro"
  tags = {
    Environment = "staging"
    Project     = "example-terraform-aws"
  }
}
