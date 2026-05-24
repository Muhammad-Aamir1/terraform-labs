# Day 8 - `count` vs `for_each`: Subnet Management

## Concepts Covered
- Problems with `count` on reordered lists (resource recreation)
- `for_each` with `set(string)` for stable resource addressing
- Two subdirectories comparing the approaches

## Structure
- `01_count_problem/` - Demonstrates how `count` causes drift when list order changes
- `02_foreach_solution/` - Shows `for_each` with sets for stable state management

## Usage

```bash
# Count problem demo
cd 01_count_problem
terraform init
terraform plan

# ForEach solution demo
cd ../02_foreach_solution
terraform init
terraform plan
```
