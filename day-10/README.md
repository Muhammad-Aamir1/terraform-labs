# Day 10 - Remote Module Sources (Git) and Version Pinning

## Concepts Covered
- Using Git-sourced modules with version tags (`ref=v1.0.0`)
- Pinning module versions for production stability
- Consuming the `terraform-gcp-network` module from GitHub
- Team A (VPC only) vs Team B (VPC + subnet)

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID
terraform init
terraform plan
```
