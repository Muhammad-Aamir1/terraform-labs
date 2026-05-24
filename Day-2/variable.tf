variable "gcp_project_id" {
  type        = string
  description = "Your actual GCP Project ID"
}

variable "gcp_region" {
  type    = string
  default = "us-central1"
}

variable "env_name" {
  type        = string
  description = "The environment name (dev, qa, prod)"
}