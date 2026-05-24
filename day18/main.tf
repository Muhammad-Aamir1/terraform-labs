# main.tf

# 🌐 SHARED NETWORKING LAYER - DO NOT TOUCH THIS
resource "google_compute_network" "shared_vpc" {
  name                    = "shared-prod-vpc"
  auto_create_subnetworks = true
}

# # 🖥️ LEGACY MICROSERVICE COMPONENTS - TO BE DECOMMISSIONED
# resource "google_compute_instance" "legacy_app_vm" {
#   name         = "legacy-app-cluster-node"
#   machine_type = "e2-medium"
#   zone         = "us-central1-a"

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }

#   network_interface {
#     network = google_compute_network.shared_vpc.name
#     access_config {} # Allocates an external IP
#   }
# }