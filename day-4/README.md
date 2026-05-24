# Day 4 - State Drift Detection

## Concepts Covered
- Detecting configuration drift between Terraform state and live GCP resources
- Creating a VPC network with a strict firewall rule (SSH only from corporate range)
- Using `terraform plan` to identify manual changes made outside Terraform

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID
terraform init
terraform plan
```
