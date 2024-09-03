# Use Terragrunt to download the module code
terraform {
  source = "../../modules/aws/ec2-instance"
}

# Fill in the variables for that module
inputs = {
  foo = "bar"
  baz = 3
}