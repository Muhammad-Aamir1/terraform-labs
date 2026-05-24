# Calling our custom multi-tier module
module "microservice_stack" {
  source       = "./modules/multi_tier_app"
  project_id   = var.gcp_project
  region       = var.gcp_region
  environment  = "dev"
  machine_type = "e2-medium"
}