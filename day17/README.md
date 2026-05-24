# Day 17 — State Manipulation (`terraform state` commands)

## Agenda
Master the `terraform state` command family to inspect, move, and remove resources in the Terraform state directly.

## Folder Structure
```
day-17/
├── main.tf        # Production VPC + monitoring firewall rule (port 9093)
├── provider.tf    # Google provider
├── variables.tf   # gcp_project_id, region
├── terraform.tfvars.example
└── README.md
```

## Prerequisites
- GCP project, credentials, Terraform >= 1.0.0

## Tasks

### 1. Deploy the infrastructure
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit with your GCP project ID
terraform init
terraform apply -auto-approve
```

### 2. List all resources in state
```bash
terraform state list
```
Shows: `google_compute_network.vpc_network`, `google_compute_firewall.monitoring_alert_rule`

### 3. Inspect a specific resource
```bash
terraform state show google_compute_network.vpc_network
```
Displays all attributes of the VPC as stored in state.

### 4. Move a resource in state
```bash
terraform state mv google_compute_firewall.monitoring_alert_rule google_compute_firewall.old_monitoring_rule
```
Now `terraform plan` will show the firewall as "deleted" and a new one created — because Terraform looks for resources by their new address.

### 5. Move it back
```bash
terraform state mv google_compute_firewall.old_monitoring_rule google_compute_firewall.monitoring_alert_rule
```

### 6. Remove a resource from state (without destroying it)
```bash
terraform state rm google_compute_firewall.monitoring_alert_rule
```
The firewall still exists in GCP, but Terraform no longer manages it.

### 7. Re-import it
```bash
terraform import google_compute_firewall.monitoring_alert_rule projects/YOUR_PROJECT_ID/global/firewalls/allow-monitoring-traffic
```

### 8. Clean up
```bash
terraform destroy -auto-approve
```

## What You Learned
- `terraform state list` / `state show` / `state rm` / `state mv`
- Moving resources without recreating them
- Removing resources from management (not from cloud)
- Re-importing resources back under management
- State is Terraform's source of truth for resource identity
