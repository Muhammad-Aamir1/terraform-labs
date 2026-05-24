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
