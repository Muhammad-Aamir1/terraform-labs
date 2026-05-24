# Primary Infrastructure (Uses the default provider automatically)
resource "google_compute_network" "vpc" {
  name                    = "primary-vpc"
  auto_create_subnetworks = true
}

resource "google_compute_instance" "primary_vm" {
  name         = "primary-application-server"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    access_config {}
  }
}

# Disaster Recovery Infrastructure (Explicitly maps to the backup alias)
resource "google_storage_bucket" "dr_backup_bucket" {
  provider                    = google.backup
  name                        = "dr-backup-storage-bucket-unique-suffix"
  location                    = "EUROPE-WEST1"
  storage_class               = "NEARLINE"
  uniform_bucket_level_access = true
}