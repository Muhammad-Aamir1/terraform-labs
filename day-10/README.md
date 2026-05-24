# Day 10 — Remote Module Sources (Git) and Version Pinning

## Agenda
Use Git-sourced modules from GitHub with version pinning (`ref=v1.0.0`). Deploy two versions of a VPC network module — one with VPC only, one with VPC + subnet.

## Folder Structure
```
day-10/
├── main.tf                  # Two module calls: team_a (v1.0.0), team_b (v2.0.2)
├── provider.tf              # Google provider
├── variables.tf             # gcp_project_id, region
├── terraform-gcp-network/   # Local clone of the remote module (for reference)
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.0.0
- Internet access (to fetch the Git module)

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
```

### 2. Initialize
```bash
terraform init
```
Terraform clones the remote module from GitHub and caches it locally.

### 3. Plan
```bash
terraform plan
```
- `network_team_a` uses tag `v1.0.0` — creates a VPC only
- `network_team_b` uses tag `v2.0.2` — creates a VPC + subnet in `us-central1`

### 4. Apply
```bash
terraform apply -auto-approve
```

### 5. Inspect the cached modules
```bash
ls -la .terraform/modules/
```
You'll see both versions cached from the remote source.

### 6. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- Git source URLs for Terraform modules
- Version pinning with `ref` tags
- Consuming modules from GitHub
- Multiple module versions in the same configuration
