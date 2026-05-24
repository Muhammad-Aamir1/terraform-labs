# Day 9 - Terraform Modules: Multi-Tier Application Stack

## Concepts Covered
- Creating reusable Terraform modules
- Multi-tier architecture: VPC + Subnet, Compute VM, Cloud SQL
- Module input variables and outputs
- Environment-prefixed resource naming

## Module: `modules/multi_tier_app/`
- **Network**: Custom VPC with private subnet (10.0.1.0/24)
- **Compute**: Debian 11 VM with public IP
- **Database**: PostgreSQL 14 Cloud SQL (db-f1-micro)

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init
terraform plan
terraform apply
```
