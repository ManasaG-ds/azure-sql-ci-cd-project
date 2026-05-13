resource "azurerm_mssql_server" "sql_server" {
  count = var.create_sql_server ? 1 : 0
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_user
  administrator_login_password = var.admin_password
}

data "azurerm_mssql_server" "existing" {
  count               = var.create_sql_server ? 0 : 1
  name                = var.server_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_mssql_database" "db" {
  name      = var.database_name
  server_id = var.create_sql_server ? azurerm_mssql_server.sql_server[0].id : data.azurerm_mssql_server.existing[0].id
  sku_name  = var.sku
}

resource "azurerm_mssql_firewall_rule" "allow_ip" {
  count = var.create_sql_server ? 1 : 0
  name             = "AllowMyIP"
  server_id        = azurerm_mssql_server.sql_server[0].id
  start_ip_address = var.start_ip
  end_ip_address   = var.end_ip
}