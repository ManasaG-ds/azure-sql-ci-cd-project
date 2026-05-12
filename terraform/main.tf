provider "azurerm" {
  features {}

}
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}


module "sql" {
  source = ".//modules/sql"
  server_name = var.sql_server_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  admin_user     = var.admin_user
  admin_password = var.admin_password

  database_name  = var.database_name
  sku            = "Basic"

  start_ip       = var.ip_address
  end_ip         = var.ip_address
}

output "sql_fqdn" {
  value = module.sql.server_fqdn
}