# Inside your root main.tf configuration

module "network_team_a" {
  source       = "git::https://github.com/Muhammad-Aamir1/terraform-gcp-network.git?ref=v1.0.0"
  network_name = "team-a-prod-vpc"
}

module "network_team_b" {
  source       = "git::https://github.com/Muhammad-Aamir1/terraform-gcp-network.git?ref=v2.0.2" # <-- Pin to the patch release
  network_name = "team-b-dev-vpc"
  subnet_cidr  = "10.0.1.0/24"
  region       = "us-central1"
}