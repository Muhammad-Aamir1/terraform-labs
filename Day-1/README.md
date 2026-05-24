# Day 1 — Terraform Fundamentals: Provider, State & GCS Backend

## Agenda
Learn the Terraform core workflow by provisioning a GCS state bucket, a VM instance, and a firewall rule. Understand remote state storage with versioning and lifecycle policies.

## Folder Structure
```
Day-1/
├── main.tf                  # Resources: GCS bucket, VM, firewall, outputs
├── provider.tf              # Google provider & GCS backend config
├── variables.tf             # Input variables (project, region, zone, bucket name, VM config)
├── terraform.tfvars.example # Template — copy to terraform.tfvars and fill in
└── README.md
```

## Prerequisites
- A GCP project with billing enabled
- GCP credentials configured (gcloud auth, service account key, or Workload Identity)
- Terraform >= 1.10.0 installed

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
```
Edit `terraform.tfvars` with your GCP project ID and a unique state bucket name.

### 2. Initialize Terraform (with remote backend)
The backend is configured as partial config in `provider.tf`. Pass the bucket details via CLI:
```bash
terraform init -backend-config="bucket=YOUR_BUCKET_NAME" -backend-config="prefix=terraform/state"
```
If you want to use local state only (no remote backend), comment out the `backend "gcs" {}` block.

### 3. Review the plan
```bash
terraform plan
```
- A GCS bucket with versioning + lifecycle rules
- An e2-medium Ubuntu 22.04 VM in `us-central1-a`
- A firewall rule allowing SSH (port 22) from anywhere
- Three outputs: external IP, internal IP, bucket name

### 4. Apply
```bash
terraform apply -auto-approve
```

### 5. Inspect outputs
```bash
terraform output vm_external_ip
terraform output state_bucket_name
```

### 6. Explore state
```bash
terraform state list
terraform state show google_compute_instance.demo_vm
```

### 7. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- Terraform init/plan/apply/destroy workflow
- Remote GCS backend with partial configuration
- Resource dependencies and output values
- Bucket versioning and lifecycle rules for state protection
