variable "gcp_project_id" {
  type        = string
  description = "Your actual GCP Project ID"
}

variable "primary_region" {
  type        = string
  default     = "us-central1"
  description = "Primary GCP region"
}

variable "primary_zone" {
  type        = string
  default     = "us-central1-a"
  description = "Primary GCP zone"
}

variable "backup_region" {
  type        = string
  default     = "europe-west1"
  description = "Disaster recovery / backup GCP region"
}
