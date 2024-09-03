#!/bin/bash
terraform plan -var-file="terraform.tfvars"
terragrunt plan
