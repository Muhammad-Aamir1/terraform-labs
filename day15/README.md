# Day 15 — Minimal Local Provider Example

## Agenda
Start with the simplest possible Terraform configuration using the built-in `local` provider to create a file. Understand the core `init → plan → apply` workflow without any cloud provider.

## Folder Structure
```
day15/
├── main.tf        # local_file resource ("Hello World" → test.txt)
├── provider.tf    # Local provider (no cloud credentials needed)
└── README.md
```

## Prerequisites
- Terraform >= 1.0.0
- No cloud credentials required

## Tasks

### 1. Initialize
```bash
terraform init
```
Downloads the `hashicorp/local` provider plugin.

### 2. Plan
```bash
terraform plan
```
Will create a file `test.txt` with content `Hello World`.

### 3. Apply
```bash
terraform apply -auto-approve
```

### 4. Verify
```bash
cat test.txt
# Output: Hello World
```

### 5. Check state
```bash
terraform state list
terraform state show local_file.test
```

### 6. Clean up
```bash
terraform destroy -auto-approve
rm -f test.txt
```

## What You Learned
- Terraform's fundamental workflow: init → plan → apply
- The `local` provider for file-based resources
- State tracking for simple resources
- Destroy removes the file from disk
