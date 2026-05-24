# Day 13 - Security Scanning with Trivy

## Concepts Covered
- Infrastructure misconfiguration scanning with Trivy
- Identifying wide-open SSH firewall rules (0.0.0.0/0)
- Detecting disks missing Customer-Managed Encryption Keys (CMEK)
- CI/CD gating with `--exit-code 1`

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init

# Run Trivy misconfiguration scan
trivy fs --scanners misconfig --severity HIGH,CRITICAL --exit-code 1 .
```
