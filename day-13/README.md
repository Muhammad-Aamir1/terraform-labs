# Day 13 — Security Scanning with Trivy

## Agenda
Scan Terraform code for infrastructure misconfigurations using Trivy. Detect wide-open firewall rules and disks missing encryption.

### Intentionally Insecure Resources
This directory contains **deliberately misconfigured** resources for scanning practice:
- Firewall rule open to `0.0.0.0/0` (SSH)
- Disk without Customer-Managed Encryption Key (CMEK)

## Folder Structure
```
day-13/
├── main.tf        # Insecure firewall (SSH wide-open) + disk (no encryption)
├── provider.tf    # Google provider
├── variables.tf   # gcp_project_id, region, zone
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- [Trivy](https://aquasecurity.github.io/trivy/) installed
- Terraform >= 1.0.0

## Tasks

### 1. Set up variables
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
```

### 2. Run Trivy scan
```bash
trivy fs --scanners misconfig --severity HIGH,CRITICAL --exit-code 1 .
```
The `--exit-code 1` flag causes Trivy to return a non-zero exit code if violations are found.

### 3. Expected findings
Trivy will flag:
- **AVD-GCP-0040**: Firewall rule allows SSH from `0.0.0.0/0` (HIGH)
- **AVD-GCP-0052**: Disk is missing `disk_encryption_key` / CMEK (HIGH)

### 4. Fix the violations (exercise)
In `main.tf`:
- Restrict `source_ranges` to a specific IP range (e.g. `["192.168.1.0/24"]`)
- Add a `disk_encryption_key` block referencing a KMS key

Re-scan to verify fixes.

### 5. Initialize Terraform (optional)
```bash
terraform init
terraform plan
```

## What You Learned
- Infrastructure-as-Code security scanning
- Trivy misconfiguration detection
- Common GCP security violations (open firewall, missing encryption)
- Integrating security scanning into the pipeline
