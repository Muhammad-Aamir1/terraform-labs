# VIOLATION 1: Firewall rule allowing global SSH ingress
resource "google_compute_firewall" "bad_firewall" {
  name    = "allow-ssh-globally"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # The scanner flags this wide-open CIDR range
  source_ranges = ["0.0.0.0/0"]
}

# VIOLATION 2: Disk missing explicit Customer-Managed Encryption Key (CMEK)
resource "google_compute_disk" "bad_disk" {
  name = "insecure-data-disk"
  type = "pd-ssd"
  zone = "us-central1-a"
  size = 50

  # VIOLATION: disk_encryption_key block is missing entirely!
  # Compliance requires: disk_encryption_key { kms_key_self_link = "..." }
}


#trivy fs --scanners misconfig --severity HIGH,CRITICAL --exit-code 1 .   // to test the code with trivy misconfig scanner for high and critical severity issues. The exit code 1 will indicate that violations were found.