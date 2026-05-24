terraform {
  required_version = ">= 1.10.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  backend "gcs" {
    # Use partial configuration via backend-config file or -backend-config flags
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
