# Day 17 - State Manipulation (`terraform state` commands)

## Concepts Covered
- `terraform state list` - View all resources in state
- `terraform state show` - Inspect a specific resource
- `terraform state rm` - Remove resources from state
- `terraform state mv` - Move/rename resources in state
- Production VPC with monitoring firewall rule

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID
terraform init
terraform apply

# State manipulation examples
terraform state list
terraform state show google_compute_network.vpc_network
```
