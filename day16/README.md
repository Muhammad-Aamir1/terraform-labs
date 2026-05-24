# Day 16 - Graph Dependency Cycles and Resolution

## Concepts Covered
- Understanding Terraform dependency graphs
- Circular dependencies between resources
- Breaking cycles using `locals` blocks
- Firewall rules referencing shared tags instead of each other

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID
terraform init
terraform plan
```
