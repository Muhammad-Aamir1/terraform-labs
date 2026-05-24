# Day 6 — Dynamic Blocks with `for_each` and `locals`

## Agenda
Use Terraform's `dynamic` block to generate multiple firewall rules from a list defined in `locals`. Avoid repetitive boilerplate.

## Folder Structure
```
day-6/
├── main.tf        # Data source (default VPC) + dynamic firewall rule
├── locals.tf      # List of 10 port/protocol definitions
├── provider.tf    # Google provider
├── variables.tf   # gcp_project_id, region
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project with a default VPC network
- Terraform >= 1.0.0

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
```

### 2. Initialize and plan
```bash
terraform init
terraform plan
```
Observe how the single `dynamic` block in `main.tf` expands into 10 `allow` blocks — one for each port defined in `locals.tf`.

### 3. Apply
```bash
terraform apply -auto-approve
```

### 4. Verify the firewall rule
```bash
terraform state show google_compute_firewall.dynamic_firewall
```
You'll see all 10 ports (22, 80, 443, 8080, 9000, 3000, 9090, 3306, 5432, 27017) in the rule.

### 5. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- `dynamic` blocks for generating repeated nested configurations
- `locals` for defining reusable data structures
- `data` sources to reference existing infrastructure
- Iterating over complex objects with `for_each` inside `dynamic`
