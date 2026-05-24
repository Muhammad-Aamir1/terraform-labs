# Day 16 — Graph Dependency Cycles and Resolution

## Agenda
Understand Terraform's resource dependency graph. See how circular dependencies between resources cause errors and how to break cycles using `locals`.

## Folder Structure
```
day-16/
├── main.tf        # BROKEN (commented) + WORKING configuration
├── provider.tf    # Google provider
├── variables.tf   # gcp_project_id, region
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.0.0

## Tasks

### 1. Study the broken configuration (top of main.tf)
The commented-out code shows a circular dependency:
- `app_firewall.source_tags` references `db_firewall.target_tags`
- `db_firewall.source_tags` references `app_firewall.target_tags`
- Terraform cannot determine which to create first → cycle error

### 2. Uncomment the broken config (to see the error)
```bash
# Temporarily comment out the WORKING section, uncomment the BROKEN section
terraform plan
# Expected: Error — cycle error in dependency graph
```

### 3. Restore the working configuration
The active code in `main.tf` resolves the cycle by moving the tags into a `locals` block:
```hcl
locals {
  app_tag = "app-server"
  db_tag  = "db-server"
}
```
Both firewall rules reference `local.app_tag` and `local.db_tag` instead of each other's attributes.

### 4. Initialize and deploy the working config
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
terraform init
terraform plan
terraform apply -auto-approve
```

### 5. Verify the firewall rules
```bash
terraform state show google_compute_firewall.app_firewall
terraform state show google_compute_firewall.db_firewall
```

### 6. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- How Terraform builds a dependency graph
- Circular dependency detection and error messages
- Using `locals` to break dependency cycles
- Tags and static values resolve at plan time, not apply time
