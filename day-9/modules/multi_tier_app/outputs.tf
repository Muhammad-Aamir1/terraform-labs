 
output "network_name" {
  value       = google_compute_network.vpc.name
  description = "The name of the created VPC"
}

output "app_server_public_ip" {
  value       = google_compute_instance.app_server.network_interface[0].access_config[0].nat_ip
  description = "Public IP address of the application server"
}

output "db_connection_name" {
  value       = google_sql_database_instance.db_instance.connection_name
  description = "The connection string/name for the Cloud SQL instance"
}