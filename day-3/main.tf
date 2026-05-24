# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "projects/${var.gcp_project_id}/global/networks/clickops-vpc"
resource "google_compute_network" "clickops_network" {
  auto_create_subnetworks                   = true
  delete_default_routes_on_create           = false
  description                               = null
  enable_ula_internal_ipv6                  = false
  internal_ipv6_range                       = null
  mtu                                       = 0
  name                                      = "clickops-vpc"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  project                                   = var.gcp_project_id
  routing_mode                              = "REGIONAL"
}

# __generated__ by Terraform from "projects/${var.gcp_project_id}/zones/us-central1-a/instances/clickops-ubuntu-vm"
resource "google_compute_instance" "clickops_vm" {
  allow_stopping_for_update = null
  can_ip_forward            = false
  deletion_protection       = false
  description               = null
  desired_status            = null
  enable_display            = false
  guest_accelerator         = []
  hostname                  = null
  labels                    = {}
  machine_type              = "e2-micro"
  metadata                  = {}
  metadata_startup_script   = null
  min_cpu_platform          = null
  name                      = "clickops-ubuntu-vm"
  project                   = var.gcp_project_id
  resource_policies         = []
  tags                      = []
  zone                      = "us-central1-a"
  boot_disk {
    auto_delete             = true
    device_name             = "clickops-ubuntu-vm"
    disk_encryption_key_raw = null # sensitive
    kms_key_self_link       = null
    mode                    = "READ_WRITE"
    source                  = "https://www.googleapis.com/compute/v1/projects/${var.gcp_project_id}/zones/us-central1-a/disks/clickops-ubuntu-vm"
    initialize_params {
      enable_confidential_compute = false
      image                       = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2604-resolute-amd64-v20260516"
      labels                      = {}
      provisioned_iops            = 0
      provisioned_throughput      = 0
      resource_manager_tags       = {}
      size                        = 10
      storage_pool                = null
      type                        = "pd-balanced"
    }
  }
  confidential_instance_config {
    confidential_instance_type  = null
    enable_confidential_compute = false
  }
  network_interface {
    internal_ipv6_prefix_length = 0
    ipv6_address                = null
    network                     = "https://www.googleapis.com/compute/v1/projects/${var.gcp_project_id}/global/networks/clickops-vpc"
    network_ip                  = "10.128.0.2"
    nic_type                    = null
    queue_count                 = 0
    stack_type                  = "IPV4_ONLY"
    subnetwork                  = "https://www.googleapis.com/compute/v1/projects/${var.gcp_project_id}/regions/us-central1/subnetworks/clickops-vpc"
    subnetwork_project          = var.gcp_project_id
    access_config {

      network_tier = "PREMIUM"

    }
  }
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    automatic_restart           = true
    instance_termination_action = null
    min_node_cpus               = 0
    on_host_maintenance         = "MIGRATE"
    preemptible                 = false
    provisioning_model          = "STANDARD"
  }
  service_account {
    email  = "${var.gcp_project_number}-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }
}
