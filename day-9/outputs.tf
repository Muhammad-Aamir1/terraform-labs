 
output "deployed_app_ip" {
  value       = module.microservice_stack.app_server_public_ip
  description = "The public IP of our application microservice"
}

output "deployed_db_connection" {
  value       = module.microservice_stack.db_connection_name
  description = "The database connection string for application config"
}