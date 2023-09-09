## ----- Log Analytics Workspace ----- ##

resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.workspace_rg_name
  sku                 = var.workspace_sku

  retention_in_days          = var.retention_in_days
  daily_quota_gb             = var.daily_quota_gb
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled

  tags = var.tags
}

## ----- Log Analytics Saved Search ----- ##

resource "azurerm_log_analytics_saved_search" "log_search" {

  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id

  for_each = var.queries

  name         = each.value.name
  category     = each.value.category
  display_name = each.value.display_name
  query        = each.value.query
  tags         = each.value.tags
}