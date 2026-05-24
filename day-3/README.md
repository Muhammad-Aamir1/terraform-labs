# Day 3 — Terraform Import: Managing Existing Infrastructure

## Agenda
Bring existing GCP resources (created manually via Cloud Console / clickops) under Terraform management using `terraform import`.

## Folder Structure
```
day-3/
├── main.tf        # Imported resources: VPC network + Compute VM
├── provider.tf    # Google provider (>= 1.5.0 for import support)
├── variables.tf   # gcp_project_id, region, zone, project_number
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- Existing resources in your GCP project:
  - A VPC named `clickops-vpc`
  - A VM named `clickops-ubuntu-vm` in `us-central1-a`
- Terraform >= 1.5.0 (supports `import` block)

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
```
Edit with your GCP project ID and project number (find in GCP Console → Settings).

### 2. Initialize
```bash
terraform init
```

### 3. Import the VPC network
```bash
terraform import google_compute_network.clickops_network projects/YOUR_PROJECT_ID/global/networks/clickops-vpc
```

### 4. Import the VM instance
```bash
terraform import google_compute_instance.clickops_vm projects/YOUR_PROJECT_ID/zones/us-central1-a/instances/clickops-ubuntu-vm
```

### 5. Generate config (optional, for `import` block approach)
If using `import` blocks instead of CLI, run:
```bash
terraform plan -generate-config-out=generated.tf
```

### 6. Verify state
```bash
terraform state list
terraform state show google_compute_network.clickops_network
```

### 7. Compare with live infrastructure
```bash
terraform plan
```
The plan should show no changes — Terraform now manages the existing resources.

### 8. Clean up (remove from state, keep resources)
```bash
terraform state rm google_compute_network.clickops_network
terraform state rm google_compute_instance.clickops_vm
```

## What You Learned
- Importing existing resources into Terraform state
- The `terraform import` CLI command
- Reviewing import-generated configuration
- Managing clickops-created infrastructure as code
