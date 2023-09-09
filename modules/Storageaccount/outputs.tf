output "storage_connection" {
  value = azurerm_storage_account.storageaccount.primary_connection_string
}

output "storage_connection_name" {
  value = azurerm_storage_account.storageaccount.name
}

output "storage_account_key1" {
  value = azurerm_storage_account.storageaccount.primary_access_key
}

output "storage_account_id" {
  value = azurerm_storage_account.storageaccount.id
}

