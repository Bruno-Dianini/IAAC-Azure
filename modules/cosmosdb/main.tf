resource "azurerm_cosmosdb_account" "cosmos_server" {
  name                          = "${var.env}-${var.customer}-cosmos-${var.workload}"
  location                      = var.location
  resource_group_name           = var.rgname
  offer_type                    = var.cosmos_offer_type
  ip_range_filter               = var.cosmos_ip_filter
  public_network_access_enabled = true
  enable_free_tier              = true # mudar pra true para tentar no cliente

  consistency_policy {
    consistency_level = var.cosmos_consistency_level
  }

  geo_location {
    location          = var.location
    failover_priority = var.cosmos_failover_prio
  }

  # is_virtual_network_filter_enabled = true

  # virtual_network_rule {
  #   id = var.subnet_ids[0]
  # }

  # virtual_network_rule {
  #   id = var.subnet_ids[1]
  # }

  backup {
    type                = var.cosmos_bkp_type
    interval_in_minutes = var.cosmos_backup_interval
    retention_in_hours  = var.cosmos_backup_retention
  }

  tags = {
    project = var.workload
    env     = var.env
  }
}

# DATABASE
resource "azurerm_cosmosdb_sql_database" "cosmos-database" {
  name                = "${var.env}-${var.workload}-${var.customer}-database"
  resource_group_name = var.rgname
  account_name        = azurerm_cosmosdb_account.cosmos_server.name
  throughput          = var.cosmosdb_throughput
}

# # COSMOS DB PRIVATE ENDPOINTS
# resource "azurerm_private_endpoint" "cosmos_server-endpoint" {
#   name                = "${var.env}-${var.customer}-cosmos-endpoint"
#   resource_group_name = var.rgname
#   location            = var.location
#   subnet_id           = var.subnet_ids[0]
#   private_service_connection {
#     name                           = "${var.env}-${var.customer}-cosmos-connection"
#     private_connection_resource_id = azurerm_cosmosdb_account.cosmos_server.id
#     is_manual_connection           = false
#     subresource_names              = ["SQL"]
#   }
# }

# resource "azurerm_monitor_diagnostic_setting" "cosmosaccworkspacediag" {
#   name                           = "${var.workload}${var.region}${var.env}-cosmos-workspace-diag-logs"
#   target_resource_id             = azurerm_cosmosdb_account.cosmosacc.id
#   log_analytics_workspace_id     = var.loganalytics_workspace_id
#   log_analytics_destination_type = "AzureDiagnostics"

#   log {
#     category = "DataPlaneRequests"
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "MongoRequests"
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "QueryRuntimeStatistics"
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "PartitionKeyStatistics"
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "PartitionKeyRUConsumption"
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "ControlPlaneRequests"
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "CassandraRequests"
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "GremlinRequests"
#     retention_policy {
#       enabled = false
#     }
#   }

#   log {
#     category = "TableApiRequests"
#     retention_policy {
#       enabled = false
#     }
#   }

#   metric {
#     category = "Requests"
#     retention_policy {
#       enabled = false
#     }
#   }

#   depends_on = [azurerm_cosmosdb_account.cosmosacc]
# }