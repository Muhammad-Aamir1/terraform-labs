resource "null_resource" "subnet" {
  for_each = var.subnets

  triggers = {
    subnet_name = each.value
  }
}