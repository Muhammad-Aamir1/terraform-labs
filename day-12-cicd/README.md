# Day 12 - CI/CD with GitHub Actions & Workload Identity Federation

This directory contains the Terraform + CI/CD pipeline code used in Day 12.

## Structure
- `terraform-gcp-network/` - Root Terraform module with VPC + subnet resources, GitHub Actions workflow, and remote state configuration

## CI/CD Pipeline
The `.github/workflows/deploy.yml` inside `terraform-gcp-network/` defines:
- PR-triggered `terraform plan`
- Merge-to-main `terraform apply`
- Workload Identity Federation for keyless GCP auth
- All variables injected via GitHub Secrets

## Usage
```bash
cd terraform-gcp-network
terraform init
terraform plan
```
