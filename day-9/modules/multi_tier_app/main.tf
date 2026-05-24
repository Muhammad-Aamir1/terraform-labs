 
# 1. Network Tier (Custom VPC & Subnet)
resource "google_compute_network" "vpc" {
  name                    = "${var.environment}-custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.environment}-app-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}

# 2. Compute Tier (App Server)
resource "google_compute_instance" "app_server" {
  name         = "${var.environment}-microservice-app"
  machine_type = var.machine_type
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {} # Allocates a public IP
  }
}

# 3. Database Tier (Cloud SQL Instance)
resource "google_sql_database_instance" "db_instance" {
  name             = "${var.environment}-microservice-db"
  region           = var.region
  database_version = "POSTGRES_14"
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
    # For a real lab environment, you would typically add ip_configuration here 
    # to tie it to the private VPC via private services access.
  }
}