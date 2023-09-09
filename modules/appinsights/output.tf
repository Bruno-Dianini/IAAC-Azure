output "app_id" {
  value = azurerm_application_insights.appsinsights.id
}

output "app_insights_cns" {
  value = azurerm_application_insights.appsinsights.connection_string
}

output "app_insights_key" {
  value = azurerm_application_insights.appsinsights.instrumentation_key
}

