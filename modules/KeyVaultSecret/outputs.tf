output "id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault_secret.secret.id
  sensitive   = true
}
