# Day 8 — `count` vs `for_each`: Subnet Management

## Agenda
Understand why `count` on a list causes resources to drift when the list is reordered, and learn how `for_each` with a `set` provides stable resource addressing.

## Folder Structure
```
day-8/
├── 01_count_problem/
│   ├── main.tf              # Empty (placeholder for count demonstration)
│   ├── variables.tf         # subnets as list(string)
│   ├── terraform.tfvars     # (gitignored) Actual subnet values
│   ├── terraform.tfvars.example
│   └── README.md
├── 02_foreach_solution/
│   ├── main.tf              # null_resource with for_each
│   ├── variables.tf         # subnets as set(string)
│   ├── terraform.tfvars     # (gitignored) Actual subnet values
│   ├── terraform.tfvars.example
│   └── README.md
└── README.md
```

## Prerequisites
- Terraform >= 1.0.0 (no cloud provider needed — uses null_resource)

## Tasks

### 1. Understand the `count` problem
```bash
cd 01_count_problem
```

In `01_count_problem/variables.tf`, `subnets` is `list(string)`. If the list order changes (e.g. remove "alpha" from the middle), `count` re-indexes — `subnet[0]` changes from "alpha" to "beta", causing all downstream resources to be recreated.

To see this:
- First use `subnets = ["subnet-alpha", "subnet-beta", "subnet-gamma"]`
- Then change to `subnets = ["subnet-beta", "subnet-gamma"]`
- `terraform plan` will show destruction of index 0 and re-creation

### 2. Use the `for_each` solution
```bash
cd ../02_foreach_solution
```
Here `subnets` is `set(string)`. Elements are identified by their value, not position. Removing "subnet-alpha" only touches that specific resource — others remain stable.

```bash
terraform init
terraform plan
```

### 3. Compare behaviors
Try swapping subnet lists in both directories and watch how `count` causes full re-indexing while `for_each` only touches changed entries.

## What You Learned
- `count` uses numeric indices — fragile when lists change
- `for_each` uses map/set keys — stable across reordering
- Always use `for_each` when resources are identified by unique values
- Use `set(string)` instead of `list(string)` for `for_each` inputs
