# Day 2 — Variables, Backend Config & Environment Isolation

## Agenda
Use Terraform input variables to parameterize infrastructure and create environment-specific backend configurations for dev/prod isolation.

## Folder Structure
```
Day-2/
├── main.tf                  # VPC network with environment-prefixed name
├── variable.tf              # Variables: project_id, region, env_name
├── backend-configs/
│   ├── dev.tfvars           # (gitignored) Actual dev backend values
│   ├── dev.tfvars.example   # Template for dev backend
│   ├── prod.tfvars          # (gitignored) Actual prod backend values
│   └── prod.tfvars.example  # Template for prod backend
├── terraform.tfvars.example # Template for input variables
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.0.0
- A GCS bucket for remote state

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
```
Edit `terraform.tfvars` — set `gcp_project_id` and `env_name` (e.g. `dev`).

### 2. Initialize with backend config
```bash
terraform init -backend-config="backend-configs/dev.tfvars"
```
This tells Terraform to store state in the GCS bucket under `directory-isolation/dev/`.

### 3. Plan & Apply
```bash
terraform plan
terraform apply -auto-approve
```
This creates a VPC named `dev-vpc-network` (or whatever env_name you set).

### 4. Check the isolated state
The state is stored at `gs://YOUR_BUCKET/directory-isolation/dev/` — isolated from any prod state.

### 5. Deploy to prod (simulate)
```bash
terraform init -backend-config="backend-configs/prod.tfvars" -reconfigure
terraform apply -auto-approve -var="env_name=prod"
```
Now the state lives under `.../directory-isolation/prod/` and creates a `prod-vpc-network`.

### 6. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- Terraform input variables with defaults
- Environment isolation via backend prefixes
- Using `-backend-config` for dynamic backend configuration
- Separating dev/prod state and infrastructure
