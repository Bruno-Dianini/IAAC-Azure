## ----- Azure Key Vault ----- ##
resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization

  # dynamic "network_acls" {
  #   for_each = var.environment == "dev" ? [] : [1]
  #   content {
  #     bypass                     = var.bypass
  #     #default_action             = var.default_action
  #     virtual_network_subnet_ids = var.virtual_network_subnet_ids
  #   }
  # }

  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  tags = var.tags
}

## ----- Configuration of Access Policies to Azure Key Vault ----- ##

# resource "azurerm_key_vault_access_policy" "kv_accesspolicy" {
#   #for_each = var.key_vault_access_policy

#   key_vault_id = azurerm_key_vault.kv.id
#   tenant_id    = each.value.tenant_id
#   object_id    = each.value.object_id

#   key_permissions         = each.value.key_permissions
#   secret_permissions      = each.value.secret_permissions
#   certificate_permissions = each.value.certificate_permissions
# } 