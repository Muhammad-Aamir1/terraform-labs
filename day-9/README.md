# Day 9 — Terraform Modules: Multi-Tier Application Stack

## Agenda
Create a reusable Terraform module (`multi_tier_app`) that provisions a 3-tier architecture — VPC + Subnet, Compute VM, and Cloud SQL Database.

## Folder Structure
```
day-9/
├── main.tf                  # Root module — calls multi_tier_app
├── provider.tf              # Google provider config
├── variables.tf             # gcp_project, region (root level)
├── outputs.tf               # App IP + DB connection
├── modules/
│   └── multi_tier_app/
│       ├── main.tf          # VPC, subnet, app server, Cloud SQL
│       ├── variables.tf     # project_id, region, environment, machine_type
│       └── outputs.tf       # network_name, app_server_public_ip, db_connection_name
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project with Compute Engine + Cloud SQL APIs enabled
- Terraform >= 1.0.0

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
```

### 2. Initialize
```bash
terraform init
```
Terraform downloads the local module from `./modules/multi_tier_app/`.

### 3. Plan
```bash
terraform plan
```
The plan creates:
- A custom VPC (`dev-custom-vpc`) with subnet (`10.0.1.0/24`)
- An e2-medium Debian 11 VM with public IP
- A PostgreSQL 14 Cloud SQL instance (db-f1-micro)

### 4. Apply
```bash
terraform apply -auto-approve
```

### 5. Check outputs
```bash
terraform output deployed_app_ip
terraform output deployed_db_connection
```

### 6. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- Creating and calling local Terraform modules
- Module input/output variables
- Multi-tier resource organization
- Environment-prefixed naming conventions
- Passing root variables into modules
