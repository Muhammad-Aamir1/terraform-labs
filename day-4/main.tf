# 1. Create a VPC Network
resource "google_compute_network" "drift_vpc" {
  name                    = "drift-lab-vpc"
  auto_create_subnetworks = true
}

# 2. Define a strict Firewall Rule for SSH
resource "google_compute_firewall" "ssh_rule" {
  name    = "allow-secure-ssh"
  network = google_compute_network.drift_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Strict corporate source range
  source_ranges = ["192.168.1.0/24"]
}