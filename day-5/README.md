# Day 5 - Lifecycle Rules & Resource Meta-Arguments

## Concepts Covered
- `create_before_destroy` lifecycle policy for zero-downtime updates
- `prevent_destroy` protection (disabled for demo purposes)
- `random_id` resource for unique VM naming
- Dynamic VM name construction with hex suffix

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID
terraform init
terraform plan
terraform apply
```
