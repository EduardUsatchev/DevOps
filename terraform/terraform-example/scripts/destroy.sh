#!/bin/bash
terraform destroy -var-file="terraform.tfvars"
terragrunt destroy
