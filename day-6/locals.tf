locals {
  firewall_rules = [
    { protocol = "tcp", ports = ["22"] },   # SSH
    { protocol = "tcp", ports = ["80"] },   # HTTP
    { protocol = "tcp", ports = ["443"] },  # HTTPS
    { protocol = "tcp", ports = ["8080"] }, # Dev App
    { protocol = "tcp", ports = ["9000"] }, # SonarQube
    { protocol = "tcp", ports = ["3000"] }, # Grafana
    { protocol = "tcp", ports = ["9090"] }, # Prometheus
    { protocol = "tcp", ports = ["3306"] }, # MySQL
    { protocol = "tcp", ports = ["5432"] }, # PostgreSQL
    { protocol = "tcp", ports = ["27017"] } # MongoDB
  ]
}