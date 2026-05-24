# Day 14 — Sensitive Variables & Secrets Management

## Agenda
Learn how to handle secrets in Terraform using `sensitive = true` and understand the risks of secrets leaking into state files and generated files.

## Folder Structure
```
day-14/
├── main.tf        # local_file resource writing a connection string with the password
├── provider.tf    # Google + Local providers
├── variables.tf   # gcp_project_id, gcp_region, db_password (sensitive)
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- Terraform >= 1.0.0

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
```
Edit `terraform.tfvars` — set a **real** password for `db_password` (the example password is for demo only).

### 2. Initialize and apply
```bash
terraform init
terraform apply -auto-approve
```

### 3. Check sensitive output behavior
```bash
terraform output db_password
# Expected: (sensitive value)
```
Terraform masks the value in CLI output.

### 4. The secret leakage problem
```bash
cat db_connection.txt
```
The password is written in plaintext to this file! The file is gitignored, but it's a risk on disk.

### 5. Check the state file
```bash
terraform state pull | grep -i password
```
State files store the raw value — anyone with state access can read secrets.

### 6. Clean up
```bash
terraform destroy -auto-approve
rm -f db_connection.txt
```

## What You Learned
- `sensitive = true` masks output in CLI
- Secrets still leak into state files and generated files
- Never commit state files or generated files (`.gitignore`)
- Use external secrets backends (Vault, Secret Manager) for production
- Mark ALL credential variables as `sensitive`
