#!/bin/bash

ENV=$1
if [[ "$ENV" != "dev" && "$ENV" != "prod" ]]; then
  echo "Usage: $0 <dev|prod>"
  exit 1
fi

echo "Starting Terraform Deployment for Environment: $ENV"

cd $(dirname "$0")

terraform init
terraform workspace new "$ENV" || terraform workspace select "$ENV"
terraform apply -var-file="envs/$ENV.tfvars" -auto-approve

echo "Terraform deployment for $ENV completed."
