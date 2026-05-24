# Day 11 — Provider Aliases: Multi-Region / Disaster Recovery

## Agenda
Configure multiple Google provider instances with aliases to deploy infrastructure across two GCP regions — primary compute in `us-central1` and DR storage in `europe-west1`.

## Folder Structure
```
day-11/
├── main.tf        # Primary VM + network + DR storage bucket
├── provider.tf    # Two provider blocks (default + "backup" alias)
├── variables.tf   # gcp_project_id, primary_region, primary_zone, backup_region
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.0
- Ensure `europe-west1` buckets are allowed in your project

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

### 3. Plan
```bash
terraform plan
```
- Default provider: VPC + e2-micro VM in `us-central1-a`
- `google.backup` provider: NEARLINE storage bucket in `europe-west1`

### 4. Apply
```bash
terraform apply -auto-approve
```

### 5. Verify regions
```bash
terraform state show google_compute_instance.primary_vm | grep zone
terraform state show google_storage_bucket.dr_backup_bucket | grep location
```

### 6. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- Provider aliases for multi-region deployments
- Explicit `provider = google.backup` mapping on resources
- Disaster recovery patterns with Terraform
- Region-scoped resource placement
