# Fetch the default VPC network in your project
data "google_compute_network" "default" {
  name = "default"
}

# Create a single firewall rule that opens all 10 ports cleanly
resource "google_compute_firewall" "dynamic_firewall" {
  name    = "lab-dynamic-ports-firewall"
  network = data.google_compute_network.default.name

  # Source ranges to accept traffic from (Open to all for lab purposes)
  source_ranges = ["0.0.0.0/0"]

  # Dynamic block iterating over the local list of rules
  dynamic "allow" {
    for_each = local.firewall_rules
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  target_tags = ["dynamic-lab-vm"]
}