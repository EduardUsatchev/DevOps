#!/bin/bash
terraform init -backend-config="bucket=your-terraform-state-bucket" \
    -backend-config="key=example-terraform-aws/terraform.tfstate" \
    -backend-config="region=us-west-2"

#terragrunt init
