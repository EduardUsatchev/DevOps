terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-west-2"  # Replace with your AWS region
    dynamodb_table = "terraform-state-lock"  # Optional: Use DynamoDB for state locking
    encrypt        = true  # Optional: Encrypt state file
  }
}

provider "vault" {
  address = "http://vault.example.com:8200"  # Replace with your Vault address
}
