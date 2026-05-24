# # ❌ BROKEN GCP CONFIGURATION: WILL CAUSE A CYCLE ERROR

# resource "google_compute_network" "vpc_network" {
#   name                    = "lab-vpc"
#   auto_create_subnetworks = true
# }

# # Rule A: App allows traffic from DB
# resource "google_compute_firewall" "app_firewall" {
#   name    = "allow-db-to-app"
#   network = google_compute_network.vpc_network.name

#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }

#   target_tags = ["app-server"]
  
#   # ❌ Dependency Loop: Referencing the target tags property of the DB firewall
#   source_tags = google_compute_firewall.db_firewall.target_tags
# }

# # Rule B: DB allows traffic from App
# resource "google_compute_firewall" "db_firewall" {
#   name    = "allow-app-to-db"
#   network = google_compute_network.vpc_network.name

#   allow {
#     protocol = "tcp"
#     ports    = ["3306"]
#   }

#   target_tags = ["db-server"]

#   # ❌ Dependency Loop: Referencing the target tags property of the App firewall
#   source_tags = google_compute_firewall.app_firewall.target_tags
# }

#  WORKING GCP CONFIGURATION: CYCLES RESOLVED

resource "google_compute_network" "vpc_network" {
  name                    = "lab-vpc"
  auto_create_subnetworks = true
}

# Define your network tags in a local block so they load first
locals {
  app_tag = "app-server"
  db_tag  = "db-server"
}

# Rule 1: Allows VMs tagged with 'db-server' to access 'app-server' on port 80
resource "google_compute_firewall" "app_firewall" {
  name    = "allow-db-to-app"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = [local.app_tag]
  source_tags = [local.db_tag] # Resolves instantly from local variables
}

# Rule 2: Allows VMs tagged with 'app-server' to access 'db-server' on port 3306
resource "google_compute_firewall" "db_firewall" {
  name    = "allow-app-to-db"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  target_tags = [local.db_tag]
  source_tags = [local.app_tag] # Resolves instantly from local variables
}