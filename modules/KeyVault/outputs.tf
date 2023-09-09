output "vault_uri" {
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
  value       = azurerm_key_vault.kv.vault_uri
}

output "key_id" {
  value = azurerm_key_vault.kv.id
}
