 
variable "gcp_project" {
  type        = string
  description = "Your target Google Cloud Project ID"
}

variable "gcp_region" {
  type        = string
  default     = "us-central1"
  description = "GCP Region"
}