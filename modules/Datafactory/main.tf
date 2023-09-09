resource "azurerm_data_factory" "data_factory" {
  name                   = var.datafactory
  location               = var.location
  resource_group_name    = var.resource_group_name
  public_network_enabled = false
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "linked_blob" {
  name              = var.datalinked
  data_factory_id   = azurerm_data_factory.data_factory.id
  connection_string = var.storage_connection
}


resource "azurerm_data_factory_pipeline" "amil_pipeline" {
  name            = var.datapipeline
  data_factory_id = azurerm_data_factory.data_factory.id

}

resource "azurerm_data_factory_linked_service_key_vault" "factory_good" {
  name            = var.datakey
  data_factory_id = azurerm_data_factory.data_factory.id
  key_vault_id    = var.key_id
}