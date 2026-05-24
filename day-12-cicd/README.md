# Day 12 — CI/CD with GitHub Actions & Workload Identity Federation

## Agenda
Set up a complete CI/CD pipeline for Terraform using GitHub Actions with keyless GCP authentication via Workload Identity Federation.

## Folder Structure
```
day-12-cicd/
├── terraform-gcp-network/       # Root Terraform + CI/CD module
│   ├── main.tf                  # VPC + subnet resources
│   ├── provider.tf              # Google provider config
│   ├── variables.tf             # project, network_name, subnet_cidr, region
│   ├── .github/workflows/deploy.yml  # CI/CD pipeline
│   ├── .gitignore
│   └── README.md
└── README.md
```

## Prerequisites
- GitHub repository with this code
- GCP project with Workload Identity Federation set up
- GitHub Secrets configured (see below)

## GitHub Secrets Required
| Secret | Description |
|--------|-------------|
| `GCP_PROJECT_ID` | Your GCP project ID |
| `GCP_WORKLOAD_IDENTITY_PROVIDER` | WIF provider resource name |
| `GCP_SERVICE_ACCOUNT_EMAIL` | Service account for GitHub Actions |
| `GCS_STATE_BUCKET` | GCS bucket for remote state |
| `GCS_STATE_PREFIX` | State prefix (e.g. `terraform/state`) |
| `GCP_NETWORK_NAME` | VPC network name |
| `GCP_SUBNET_CIDR` | Subnet CIDR range |
| `GCP_REGION` | GCP region |

## CI/CD Pipeline (`.github/workflows/deploy.yml`)
```
Triggers:
  - Push to main    → terraform apply
  - Pull request    → terraform plan
  - Manual dispatch → terraform apply
```

### Workflow Steps:
1. Checkout code
2. Authenticate to GCP via WIF (keyless)
3. Setup Terraform
4. `terraform init` with remote backend
5. `terraform plan` (on PR)
6. `terraform apply` (on push to main)

## Local Testing
```bash
cd terraform-gcp-network
terraform init
terraform plan
terraform apply
```

## What You Learned
- GitHub Actions CI/CD for Terraform
- Workload Identity Federation for keyless auth
- Environment injection via GitHub Secrets
- Plan on PR, apply on merge workflow
- Remote state management in CI/CD
