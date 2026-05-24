# Day 1 - Terraform Fundamentals: Provider Setup, State & GCS Backend

## Concepts Covered
- Terraform provider configuration (Google provider ~> 6.0)
- GCS backend for remote state storage
- Compute instance provisioning (e2-medium VM with Ubuntu 22.04)
- Firewall rules (SSH access)
- GCS bucket with versioning, lifecycle rules, and uniform access
- Output values (VM IPs, bucket name)

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID and bucket name
terraform init -backend-config="bucket=YOUR_BUCKET" -backend-config="prefix=terraform/state"
terraform plan
terraform apply
```
