# 02 — ForEach Solution

## Agenda
Demonstrates how `for_each` with `set(string)` provides stable resource addressing even when the set is reordered.

## Usage
```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
# Edit terraform.tfvars to remove elements, then:
terraform plan
terraform apply
```

Observe: removing an element only affects that specific resource — no unintended cascading changes.
