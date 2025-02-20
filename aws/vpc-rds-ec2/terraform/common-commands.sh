# Run a Terraform plan
terraform plan -var-file="envs/dev.tfvars"

# Apply Terraform configuration
terraform apply -var-file="envs/dev.tfvars"

# Destroy resources
terraform destroy -var-file="envs/dev.tfvars"

# Show Terraform state
terraform show
