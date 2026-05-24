variable "gcp_project_id" {
  type        = string
  description = "Your actual GCP Project ID"
}

variable "gcp_region" {
  type        = string
  default     = "us-central1"
  description = "GCP region"
}

variable "gcp_zone" {
  type        = string
  default     = "us-central1-a"
  description = "GCP zone"
}

variable "gcp_project_number" {
  type        = string
  description = "Your GCP Project Number (numeric, found in Project Settings)"
}
