variable "admin_user" {
  description = "SQL admin user"
  type        = string
}


variable "admin_password" {
  description = "SQL admin password"
  type        = string
}

variable "ip_address" {
description = "SQL server IP address"
type = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}


variable "sql_server_name_prefix" {
  description = "SQL server name"
  type        = string
}


variable "database_name" {
  description = "SQL database name"
  type        = string
}