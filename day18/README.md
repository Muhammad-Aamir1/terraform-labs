# Day 18 - Refactoring and State Moves (`terraform state mv`)

## Concepts Covered
- Renaming/moving resources in state with `terraform state mv`
- Decommissioning legacy resources
- Shared networking layer separation of concerns
- Zero-downtime refactoring patterns

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID
terraform init
terraform plan
```
