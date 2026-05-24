locals {
  # Filtered Map: Creates a new map containing ONLY engineering users
  eng_users = {
    for username, details in var.user_directory : username => details
    if details.department == "engineering"
  }
}

# Create IAM Service Accounts only for the filtered list
resource "google_service_account" "eng_accounts" {
  for_each     = local.eng_users
  account_id   = "eng-${each.key}"
  display_name = "Engineering Service Account for ${each.value.full_name}"
}

# Output the filtered map to easily verify the results during execution
output "filtered_engineering_team" {
  value       = local.eng_users
  description = "The list of users who successfully passed through the Terraform filter."
}
