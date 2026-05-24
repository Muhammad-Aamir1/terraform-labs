# 01 — Count Problem Demo

## Agenda
Demonstrates how `count` on a `list(string)` causes unintended resource recreation when the list order changes.

## Usage
```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
# Edit terraform.tfvars to reorder/remove elements, then:
terraform plan
terraform apply
```

Observe: removing an element from the middle causes all subsequent resources to be destroyed and recreated due to index shifting.
