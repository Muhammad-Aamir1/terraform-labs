# 1. Base Network
resource "google_compute_network" "lifecycle_vpc" {
  name                    = "lifecycle-lab-vpc"
  auto_create_subnetworks = true
}

# 2. Generate a unique suffix for the VM name
resource "random_id" "vm_suffix" {
  byte_length = 4
}

# 3. Production VM with Dynamic Naming
resource "google_compute_instance" "prod_vm" {
  # We construct a dynamic name using the random suffix hex output
  name         = "production-web-vm-${random_id.vm_suffix.hex}"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = google_compute_network.lifecycle_vpc.name
    access_config {} 
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false //generally for production scenarios it shud be kept true, but for demo purposes we can set it to false
  }
}