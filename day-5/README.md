# Day 5 — Lifecycle Rules & Resource Meta-Arguments

## Agenda
Explore Terraform lifecycle policies — `create_before_destroy` for zero-downtime updates and `prevent_destroy` for production protection. Use `random_id` for unique naming.

## Folder Structure
```
day-5/
├── main.tf        # VPC, random_id, VM with lifecycle rules
├── provider.tf    # Google + Random providers
├── variables.tf   # gcp_project_id, region, zone
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.5.0

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
```

### 2. Initialize and deploy
```bash
terraform init
terraform apply -auto-approve
```
Notice the VM name: `production-web-vm-<random_hex>` — the random suffix prevents name collisions.

### 3. Observe create_before_destroy
Make a change that triggers recreation (e.g. change the VM image in main.tf to `ubuntu-os-cloud/ubuntu-2404-lts`):
```bash
terraform plan
```
The plan shows the new VM being created BEFORE the old one is destroyed.

### 4. Test prevent_destroy
Uncomment `prevent_destroy = true` in `main.tf`, then:
```bash
terraform destroy
# Expected: Error — resource has prevent_destroy set
```

### 5. Clean up
```bash
# Set prevent_destroy back to false, then:
terraform destroy -auto-approve
```

## What You Learned
- `create_before_destroy` for zero-downtime deployments
- `prevent_destroy` as a safety guard for production resources
- `random_id` for generating unique resource names
- How Terraform resolves the ordering of destroy/create operations
