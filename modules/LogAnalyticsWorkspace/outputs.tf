output "id" {
  description = "The Log Analytics Workspace ID."
  value       = azurerm_log_analytics_workspace.log_workspace.id
}

output "primary_shared_key" {
  sensitive   = true
  description = "The Primary shared key for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.log_workspace.primary_shared_key
}

output "secondary_shared_key" {
  sensitive   = true
  description = "The Secondary shared key for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.log_workspace.secondary_shared_key
}

output "workspace_id" {
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.log_workspace.workspace_id
}

output "workspace_name" {
  description = "The Workspace (or Customer) name for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.log_workspace.name
}