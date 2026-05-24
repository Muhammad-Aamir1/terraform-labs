# Day 11 - Provider Aliases: Multi-Region / Disaster Recovery

## Concepts Covered
- Multiple provider configurations with aliases
- Primary region (us-central1) for compute and networking
- Backup region (europe-west1) for DR storage
- Explicit provider mapping per resource

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID
terraform init
terraform plan
terraform apply
```
