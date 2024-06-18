# Example Terraform AWS Project

## Overview

This project demonstrates a structured approach to managing AWS infrastructure with Terraform. It includes reusable modules for VPC and EC2 instances, environment-specific configurations, and helper scripts for common Terraform operations.

## Project Structure

- `environments/`: Contains environment-specific configurations (dev, staging, prod).
- `global/`: Contains global variables and outputs shared across environments.
- `modules/`: Contains reusable modules (VPC, EC2).
- `scripts/`: Contains helper scripts for Terraform operations.
- Root files: Main Terraform configuration and variables.

## Usage

### Initialize

```sh
./scripts/init.sh
./scripts/plan.sh
./scripts/apply.sh
./scripts/destroy.sh
```


# Module Documentation
## VPC Module
### Variables:

- vpc_name: Name of the VPC.
- cidr_block: CIDR block for the VPC.
### Outputs:

- vpc_id: ID of the VPC.
## EC2 Module
### Variables:

- instance_type: EC2 instance type.
- vpc_id: ID of the VPC.
- subnet_id: ID of the subnet.
### Outputs:

- instance_id: ID of the EC2 instance.

# Directory Structure
example-terraform-aws/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   ├── staging/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   ├── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
├── global/
│   ├── variables.tf
│   ├── outputs.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── README.md
│   ├── ec2/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── README.md
├── scripts/
│   ├── init.sh
│   ├── plan.sh
│   ├── apply.sh
│   ├── destroy.sh
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── providers.tf
├── backend.tf
├── README.md
