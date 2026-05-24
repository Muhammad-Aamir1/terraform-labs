# Day 6 - Dynamic Blocks with `for_each` and `locals`

## Concepts Covered
- `dynamic` block to generate repeatable firewall rules from a list
- `locals` block for defining port/protocol mappings
- `data` source to fetch the default VPC
- Single firewall rule with 10 open TCP ports

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID
terraform init
terraform plan
```
