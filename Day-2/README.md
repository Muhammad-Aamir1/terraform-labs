# Day 2 - Variables, Backend Config & Environment Isolation

## Concepts Covered
- Terraform input variables (project ID, region, environment name)
- Dynamic GCS backend with environment-specific configs
- Environment isolation using `dev.tfvars` and `prod.tfvars`
- VPC network creation with environment-prefixed naming

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init -backend-config="backend-configs/dev.tfvars"
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```
