output "sql_server_name" {
  value = var.create_sql_server ? azurerm_mssql_server.sql_server[0].name : data.azurerm_mssql_server.existing[0].name
}

output "sql_server_id" {
  value = var.create_sql_server ? azurerm_mssql_server.sql_server[0].id : data.azurerm_mssql_server.existing[0].id
}

output "database_name" {
  value = azurerm_mssql_database.db.name
}


output "server_fqdn" {
  value = var.create_sql_server ? azurerm_mssql_server.sql_server[0].fully_qualified_domain_name : data.azurerm_mssql_server.existing[0].fully_qualified_domain_name
}