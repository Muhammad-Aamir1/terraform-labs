# Day 4 — State Drift Detection

## Agenda
Learn how to detect configuration drift — when infrastructure is modified outside Terraform — and reconcile the state.

## Folder Structure
```
day-4/
├── main.tf        # VPC + strict firewall rule (SSH from corporate range)
├── provider.tf    # Google provider
├── variables.tf   # gcp_project_id, region
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.5.0

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
```

### 2. Initialize and deploy
```bash
terraform init
terraform apply -auto-approve
```

### 3. Simulate drift (do this in Cloud Console or gcloud)
Manually change the firewall rule's source range via the GCP Console or CLI:
```bash
gcloud compute firewall-rules update allow-secure-ssh --source-ranges=0.0.0.0/0
```
This changes the SSH rule from `192.168.1.0/24` to open to the world.

### 4. Detect the drift
```bash
terraform plan
```
Terraform will show that `source_ranges` has changed out-of-band and propose restoring it.

### 5. Reconcile
```bash
terraform apply -auto-approve
```
Terraform reverts the firewall rule back to the strict `192.168.1.0/24` range.

### 6. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- How manual changes (drift) appear in `terraform plan`
- Detecting out-of-band modifications
- Terraform as source of truth — applying restores desired state
- Using `terraform refresh` to update state without applying
