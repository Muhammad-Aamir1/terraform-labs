variable "gcp_project_id" {
  type        = string
  description = "Your actual GCP Project ID"
}

variable "gcp_region" {
  type        = string
  default     = "us-central1"
  description = "GCP region"
}

variable "db_password" {
  type        = string
  description = "The root password for our Cloud SQL database instance"
  sensitive   = true
}
