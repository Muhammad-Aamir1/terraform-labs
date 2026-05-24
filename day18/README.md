# Day 18 — Refactoring and State Moves (`terraform state mv`)

## Agenda
Learn to refactor Terraform configurations safely — renaming resources, decommissioning legacy infrastructure, and reorganizing state without destroying live resources.

## Folder Structure
```
day-18/
├── main.tf        # Shared VPC (active) + legacy VM (commented out)
├── provider.tf    # Google provider
├── variables.tf   # gcp_project_id, region, zone
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.0.0

## Tasks

### 1. Deploy the shared VPC
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
terraform init
terraform apply -auto-approve
```

### 2. Simulate a legacy resource rename
If a resource was poorly named, use `state mv` to rename it without destroying:
```bash
terraform state mv google_compute_network.shared_vpc google_compute_network.production_shared_vpc
```
Then update the resource name in `main.tf` from `shared_vpc` to `production_shared_vpc`.

### 3. Verify plan shows no changes
```bash
terraform plan
```
Should show no changes — the state was updated to match the new name.

### 4. Rename it back in state
```bash
terraform state mv google_compute_network.production_shared_vpc google_compute_network.shared_vpc
```
Restore `main.tf` back to `shared_vpc`.

### 5. Simulate decommissioning
The legacy VM is commented out in `main.tf`. If it were active and you wanted to stop managing it:
```bash
terraform state rm google_compute_instance.legacy_app_vm
```
The resource remains in GCP but Terraform no longer tracks it.

### 6. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- Safe refactoring with `terraform state mv`
- Renaming resources without recreation
- Decommissioning patterns (comment out + state rm)
- Separating shared infrastructure from application resources
