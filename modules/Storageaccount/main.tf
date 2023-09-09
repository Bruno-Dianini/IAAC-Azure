resource "azurerm_storage_account" "storageaccount" {
  name                     = var.storageaccount_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  is_hns_enabled           = var.is_hns_enabled
  access_tier              = var.access_tier

  network_rules {
    default_action             = var.default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids #[azurerm_subnet.subnet.id]
  }

  tags = var.tags
}

