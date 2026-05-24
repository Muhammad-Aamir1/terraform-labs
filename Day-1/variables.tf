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

variable "state_bucket_name" {
  type        = string
  description = "Name of the GCS bucket for Terraform state storage"
}

variable "vm_name" {
  type        = string
  default     = "terraform-demo-vm"
  description = "Name of the demo VM instance"
}

variable "vm_machine_type" {
  type        = string
  default     = "e2-medium"
  description = "Machine type for the demo VM"
}
