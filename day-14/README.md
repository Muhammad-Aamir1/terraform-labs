# Day 14 - Sensitive Variables & Secrets Management

## Concepts Covered
- Marking variables as `sensitive = true` to mask output
- Risks of secrets leaking into generated files
- Best practices for password/secret injection

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GCP project ID and a secure password
terraform init
terraform plan
terraform apply
```

> **Security Note**: The `db_connection.txt` file is gitignored to prevent secret leakage.
> Never commit files containing actual passwords or connection strings.
