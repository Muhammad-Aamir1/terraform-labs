terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.primary_region
  zone    = var.primary_zone
}

provider "google" {
  alias   = "backup"
  project = var.gcp_project_id
  region  = var.backup_region
}
