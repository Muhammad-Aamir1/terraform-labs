 # main.tf

resource "google_compute_network" "vpc_network" {
  name                    = "production-vpc"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "monitoring_alert_rule" {
  name    = "allow-monitoring-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["9093"] # Imagine we need to change this to 9093
  }

  source_ranges = ["0.0.0.0/0"]
}