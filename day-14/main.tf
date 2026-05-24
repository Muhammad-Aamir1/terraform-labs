resource "local_file" "db_config" {
  filename = "${path.module}/db_connection.txt"
  content  = "Server=10.0.0.5;User=root;Password=${var.db_password};"
}
