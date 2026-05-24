# ====================================================================
# STATE STORAGE (PRODUCTION SECURITY PROFILE)
# ====================================================================
resource "google_storage_bucket" "tf_state" {
  name                        = var.state_bucket_name
  location                    = "US"
  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}

# ====================================================================
# PHASE 3: COMPUTE INSTANCE (VM)
# ====================================================================
resource "google_compute_instance" "demo_vm" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 20
    }
  }

  network_interface {
    network = "default"
    access_config {
      # External IP — enables SSH access
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = ["http-server", "https-server"]

  labels = {
    environment = "demo"
    managed_by  = "terraform"
  }
}

# ====================================================================
# PHASE 4: FIREWALL RULE (allow SSH)
# ====================================================================
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-from-anywhere"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

# ====================================================================
# OUTPUTS
# ====================================================================
output "vm_external_ip" {
  value       = google_compute_instance.demo_vm.network_interface[0].access_config[0].nat_ip
  description = "External IP of the demo VM"
}

output "vm_internal_ip" {
  value       = google_compute_instance.demo_vm.network_interface[0].network_ip
  description = "Internal IP of the demo VM"
}

output "state_bucket_name" {
  value       = google_storage_bucket.tf_state.name
  description = "Name of the GCS bucket storing Terraform state"
}