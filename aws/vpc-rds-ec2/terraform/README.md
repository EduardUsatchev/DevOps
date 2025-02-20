### Updated `README.md` with Explanations of the Scripts

---

## Introduction

This repository provides a structured way to deploy resources on AWS, locally simulated using LocalStack. The setup includes creating VPCs, subnets, and EC2 instances tailored for different environments (e.g., `dev`, `prod`), and integrates a MySQL container as an RDS-like service. All tasks are managed through a set of shell scripts for consistent, repeatable deployments.

---

## Directory Structure

```
terraform/
├── envs/
│   ├── dev.tfvars
│   ├── prod.tfvars
├── modules/
│   ├── ec2/
│   ├── vpc/
│   ├── security_group/
├── main.tf
├── variables.tf
├── provider.tf
├── outputs.tf
├── backend.tf
├── deployment_scripts/
│   ├── run-terraform.sh
│   ├── verify-deployment.sh
│   ├── common-commands.sh
```

---


---

## Scripts Overview

### `run-terrafrom.sh`

- **Purpose**:  
  Deploys infrastructure for a specified environment (`dev` or `prod`).

- **Usage**:  
  ```bash
  ./run-terrafrom.sh <dev|prod>
  ```

- **What It Does**:
  1. Checks the environment argument.
  2. Initializes Terraform.
  3. Selects the appropriate workspace or creates a new one.
  4. Applies the Terraform configuration using environment-specific variables.

---

### `run-deployment.sh`

- **Purpose**:  
  Ensures LocalStack is running, then deploys the environment using Terraform, simulates EC2 instances using Docker, and provides access instructions.

- **Usage**:  
  ```bash
  ./run-deployment.sh <dev|prod>
  ```

- **What It Does**:
  1. Checks and starts LocalStack if it’s not already running.
  2. Deploys Terraform configurations for the specified environment.
  3. Fetches and displays EC2 instance details.
  4. Simulates an EC2 instance using Docker.
  5. Outputs instructions for accessing the simulated EC2 environment.

---

## Common Terraform Commands

Here are some commonly used Terraform commands for reference:

- **Initialize Terraform**:  
  ```bash
  terraform init
  ```

- **Plan Infrastructure Changes**:  
  ```bash
  terraform plan
  ```

- **Apply Changes**:  
  ```bash
  terraform apply -var-file="envs/dev.tfvars"
  ```

- **Destroy Resources**:  
  ```bash
  terraform destroy -var-file="envs/dev.tfvars"
  ```

- **List Workspaces**:  
  ```bash
  terraform workspace list
  ```

- **Select a Workspace**:  
  ```bash
  terraform workspace select <workspace_name>
  ```

- **Create a New Workspace**:  
  ```bash
  terraform workspace new <workspace_name>
  ```

- **Check Configuration Syntax**:  
  ```bash
  terraform validate
  ```

---

This README provides an overview of the scripts and commands needed to manage the infrastructure environments with Terraform and LocalStack.