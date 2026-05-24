 variable "project_id" {
  type        = string
  description = "The GCP Project ID"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "The target GCP region"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Deployment environment (e.g., dev, prod)"
}

variable "machine_type" {
  type        = string
  default     = "e2-micro"
  description = "The VM instance size"
}
