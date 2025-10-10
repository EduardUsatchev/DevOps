# 🌍 Terraform Example Project

This directory demonstrates **Infrastructure as Code (IaC)** using **Terraform** and **Terragrunt** to manage modular, multi-environment infrastructure across `dev`, `staging`, and `prod`.  

It’s designed as a **DevOps training lab** for learning real-world Terraform practices, including remote backends, reusable modules, and automation scripts.

---

## 📁 Directory Overview

| Folder / File | Description |
|----------------|-------------|
| **terraform_example/** | Root directory containing Terraform configuration, modules, environment definitions, and helper scripts. |
| **terraform_example/backend.tf** | Defines the remote backend configuration (e.g., S3, GCS, Azure Blob) for storing Terraform state. |
| **terraform_example/main.tf** | Root configuration that wires together modules such as VPC and EC2. |
| **terraform_example/providers.tf** | Configures the cloud provider (e.g., AWS) credentials, regions, and versions. |
| **terraform_example/variables.tf** | Declares input variables for the root module. |
| **terraform_example/outputs.tf** | Defines outputs for sharing infrastructure values between modules and environments. |
| **terraform_example/terraform.tfvars** | Default values for root variables (used when no env overrides are specified). |
| **terraform_example/terragrunt.hcl** | Base Terragrunt configuration that helps manage multiple environments consistently. |
| **terraform_example/modules/** | Contains reusable Terraform modules (e.g., `vpc/`, `ec2/`). |
| **terraform_example/environments/** | Contains environment-specific configurations for dev, staging, and prod. |
| **terraform_example/scripts/** | Helper shell scripts to initialize, plan, apply, and destroy infrastructure safely. |

---

## 🧩 Module Structure

### 📦 Modules (`modules/`)
| Module | Description |
|---------|-------------|
| **vpc/** | Provisions a custom VPC, subnets, and networking resources. |
| **ec2/** | Provisions EC2 instances and associated security groups within the VPC. |

Each module includes:
- `main.tf` — Resource definitions  
- `variables.tf` — Input parameters  
- `outputs.tf` — Exported values  

---

### 🌱 Environments (`environments/`)
| Environment | Purpose |
|--------------|----------|
| **dev/** | Sandbox environment for feature testing and learning. |
| **staging/** | QA/pre-production environment for validating changes. |
| **prod/** | Production-ready infrastructure deployment. |

Each environment folder includes:
- `main.tf` — Local configuration importing modules.  
- `variables.tf` — Environment-specific variables.  
- `terraform.tfvars` — Values unique to that environment (e.g., instance type, CIDR).  
- `terragrunt.hcl` — Wrapper to inherit common configuration from root and manage remote state paths automatically.

---

### ⚙️ Scripts (`scripts/`)
| Script | Description |
|--------|--------------|
| **init.sh** | Initializes Terraform backend and providers. |
| **plan.sh** | Runs `terraform plan` or `terragrunt plan` for previewing infrastructure changes. |
| **apply.sh** | Applies infrastructure changes safely. |
| **destroy.sh** | Tears down the environment. |
| **vault.sh** | (Optional) Demonstrates secret management with HashiCorp Vault integration. |

All scripts are designed to run from inside an environment folder or from the root (with Terragrunt).

---

## 🧠 Learning Objectives

- Understand **Terraform project structure** (modules vs environments).  
- Learn how to use **remote backends** for shared state.  
- Implement **DRY infrastructure** using Terragrunt.  
- Create reusable Terraform **modules** for compute and networking.  
- Automate Terraform commands via shell **helper scripts**.  
- Manage configuration drift between multiple environments.  
- Integrate secrets with **Vault** (optional advanced exercise).  

---

## ⚙️ Quick Start

### 🧱 1. Install Required Tools
```bash
brew install terraform terragrunt
# or on Linux
sudo apt install terraform
