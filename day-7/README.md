# Day 7 — `for` Expressions and Map Filtering

## Agenda
Use Terraform's `for` expression to filter a map of users by department and create IAM service accounts only for the filtered subset.

## Folder Structure
```
day-7/
├── main.tf        # Local expression (for) + service accounts + output
├── provider.tf    # Google provider
├── variables.tf   # gcp_project_id, region, user_directory map
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.0.0

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
```

### 2. Initialize and plan
```bash
terraform init
terraform plan
```
The plan should create 3 service accounts (only engineering users: r-das, p-patel, s-nair).

### 3. Apply
```bash
terraform apply -auto-approve
```

### 4. Check the output
```bash
terraform output filtered_engineering_team
```
Shows the filtered map with only engineering department users.

### 5. Verify in GCP
```bash
gcloud iam service-accounts list --filter="email:eng-*"
```

### 6. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- `for` expressions with `if` conditionals
- Filtering maps by value attributes
- `for_each` over a filtered map
- Creating multiple resources from structured data
