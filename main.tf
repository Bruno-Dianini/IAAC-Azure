data "azurerm_client_config" "current" {}



module "vnet-000" {
  source = "./modules/Vnet"

  resource_group_name           = var.resource_group_name
  location                      = var.location
  vnet-name                     = var.vnet-name
  vnet-sng                      = var.vnet-name
  sbnet-name-1                  = var.sbnet-name-1
  address_space                 = var.address_space
  address_prefix                = var.address_prefix
  tags                          = var.tags

}

##################################################

module "storageaccount-001" {
  source                     = "./modules/Storageaccount"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storageaccount_name        = var.storageaccount_name
  account_tier               = var.account_tier
  account_replication_type   = var.account_replication_type
  default_action             = var.default_action
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = [module.vnet-000.azurerm_subnet_subnet_id]
  is_hns_enabled             = var.is_hns_enabled
  access_tier                = var.access_tier
  tags                       = var.tags

  depends_on = [module.vnet-000]
}

##################################################

module "storageaccount-002" {
  source                     = "./modules/Storageaccount"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storageaccount_name        = var.storageaccount_name002
  account_tier               = var.account_tier002
  account_replication_type   = var.account_replication_type002
  default_action             = var.default_action002
  ip_rules                   = var.ip_rules002
  virtual_network_subnet_ids = [module.vnet-000.azurerm_subnet_subnet_id]
  is_hns_enabled             = var.is_hns_enabled002
  access_tier                = var.access_tier002

  tags = var.tags

  depends_on = [module.storageaccount-001]
}

##################################################

module "storageaccount-003" {
  source                     = "./modules/Storageaccount"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storageaccount_name        = var.storageaccount_name003
  account_tier               = var.account_tier003
  account_replication_type   = var.account_replication_type003
  default_action             = var.default_action003
  ip_rules                   = var.ip_rules003
  virtual_network_subnet_ids = [module.vnet-000.azurerm_subnet_subnet_id]
  is_hns_enabled             = var.is_hns_enabled003
  access_tier                = var.access_tier003

  tags = var.tags

  depends_on = [module.storageaccount-002]
}

##################################################

module "storageaccount-004" {
  source                     = "./modules/Storageaccount"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storageaccount_name        = var.storageaccount_name004
  account_tier               = var.account_tier004
  account_replication_type   = var.account_replication_type004
  default_action             = var.default_action004
  ip_rules                   = var.ip_rules004
  virtual_network_subnet_ids = [module.vnet-000.azurerm_subnet_subnet_id]
  is_hns_enabled             = var.is_hns_enabled004
  access_tier                = var.access_tier004

  tags = var.tags

  depends_on = [module.storageaccount-003]
}

##################################################

module "keyvault" {
  source                          = "./modules/KeyVault"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  key_vault_name                  = var.key_vault_name
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  environment                     = var.environment
  purge_protection_enabled        = var.purge_protection_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  tags                            = var.tags

  depends_on = [module.storageaccount-004]
}

##################################################

module "datafactory" {
  source = "./modules/DataFactory"

  datafactory         = var.datafactory
  resource_group_name = var.resource_group_name
  location            = var.location
  datalinked          = var.datalinked
  datapipeline        = var.datapipeline
  datakey             = var.datakey
  storage_connection  = module.storageaccount-001.storage_connection
  key_id              = module.keyvault.key_id

  depends_on = [module.keyvault]
}

##################################################

#################################################
# module "aks" {
#   count                     = var.aks_enabled
#   source                    = "./modules/aks"
#   env                       = var.env
#   workload                  = var.workload
#   region                    = var.region
#   location                  = module.resourcegroup[0].rg_location
#   rgname                    = module.resourcegroup[0].rg_name
#   aksinstancesize           = var.aksinstancesize
#   max_pods                  = var.max_pods
#   node_count                = var.node_count
#   id_type                   = var.id_type
#   networkaks                = var.networkaks
#   skulbaks                  = var.skulbaks
#   subnet_id                 = module.network[0].subnet1_id
#   default_node_pool_name    = var.default_node_pool_name
#   aks_network_policy        = var.aks_network_policy
#   aks_availability_zones    = var.aks_availability_zones
#   aks_os_disk_size_gb       = var.aks_os_disk_size_gb
#   aks_rg_id                 = module.resourcegroup[0].rg_id
#   tag                       = var.ocr_tag
#   loganalytics_workspace_id = module.loganalytics[0].log_analytics_workspace_id
#   app_depends_on            = [module.network]

# }

#################################################
module "mlservices" {
  source                   = "./modules/mlservices"
  env                      = var.env
  customer                 = var.customer
  workload                 = var.workload
  location                 = var.location
  rgname                   = var.resource_group_name
  application_insights_id  = module.appinsights.app_id
  key_vault_id             = module.keyvault.key_id
  storage_account_id       = module.storageaccount-001.storage_account_id
  ml_cluster_name          = var.ml_cluster_name
  type                     = var.ml_workspace_type
  ml_vm_cluster_size       = var.ml_vm_cluster_size
  vm_priority              = var.vm_priority
  min_cluster_nodes        = var.min_cluster_nodes
  max_cluster_nodes        = var.max_cluster_nodes
  time_to_scale_down       = var.time_to_scale_down
  ml_vm_authorization_type = var.ml_vm_authorization_type
  # subnet_id                  = module.network.subnet1_id
  # this_depends_on            = [module.network, module.keyvault]
  tenant_id = var.tenantid
  # log_analytics_workspace_id = module.loganalytics.log_analytics_id
}

#################################################
module "cognitiveservices" {
  source     = "./modules/cognitiveservices"
  env        = var.env
  customer   = var.customer
  workload   = var.workload
  location   = var.location
  rgname     = var.resource_group_name
  cs_names   = var.cs_names
  cs_kinds   = var.cs_kinds
  cs_skus    = var.cs_skus
  cs_id_type = var.cs_id_type
  # cs_nw_acl_action   = var.cs_nw_acl_action
  # cs_nw_iprules      = var.cs_nw_iprules
  # cs_nw_subnet_rules = [module.network[0].subnet1_id, module.network[0].subnet2_id]

}
#################################################
module "appinsights" {
  source           = "./modules/appinsights"
  env              = var.env
  workload         = var.workload
  location         = var.location
  resource_group_name          = var.resource_group_name
  
  application_type = var.app_type
  # tag              = var.ocr_tag
}

module "appservice" {
  source             = "./modules/appservice"
  env                = var.env
  customer           = var.customer
  workload           = var.workload
  location           = var.location
  rgname             = var.resource_group_name
  fa_names           = var.fa_names
  apps_os_type       = var.apps_os_type
  apps_sku_name      = var.apps_sku_name
  fa_identity_type   = var.fa_identity_type
  fa_appi_key        = module.appinsights.app_insights_key
  fa_appi_cns        = module.appinsights.app_insights_cns
  fa_appi_id         = module.appinsights.app_id
  fa_py_version      = var.fa_py_version
  fa_logs_size       = var.fa_logs_size
  fa_retention_logs  = var.fa_retention_logs
  fa_storage         = module.storageaccount-001.storage_connection_name
  fa_storage_use_key = module.storageaccount-001.storage_account_key1
  fa_app_storage_key = module.storageaccount-001.storage_connection
  # subnet_ids         = [module.network.subnet1_id, module.network.subnet2_id, module.network.subnet3_id]
  functions_app_settings = var.functions_app_settings
  # web_app_settings = var.web_app_settings
  fa_tags            = var.fa_tags
}

module "cosmosdb" {
  source                   = "./modules/cosmosdb"
  env                      = var.env
  customer                 = var.customer
  workload                 = var.workload
  location                 = var.location
  rgname                   = var.resource_group_name
  cosmos_offer_type        = var.cosmos_offer_type
  cosmos_ip_filter         = var.cosmos_ip_filter
  cosmos_consistency_level = var.cosmos_consistency_level
  cosmos_failover_prio     = var.cosmos_failover_prio
  # subnet_ids               = [module.network[0].subnet1_id, module.network[0].subnet2_id]
  cosmos_backup_interval   = var.cosmos_backup_interval
  cosmos_backup_retention  = var.cosmos_backup_retention
  cosmosdb_throughput      = var.cosmosdb_throughput
  cosmos_bkp_type          = var.cosmos_bkp_type
}

module "vm" {
  source                = "./modules/vm"
  env                   = var.env
  customer              = var.customer
  workload              = var.workload
  location              = var.location
  rgname                = var.resource_group_name
  subnet_ids            = module.vnet-000.azurerm_subnet_subnet_id
  vm_names              = var.vm_names
  vm_admins             = var.vm_admins
  vm_smi                = var.vm_smi
  vm_size               = var.vm_size
  vm_priv_ip_conf       = var.vm_priv_ip_conf
  vm_os_caching         = var.vm_os_caching
  vm_os_storage_account = var.vm_os_storage_account
  vm_image_publisher    = var.vm_image_publisher
  vm_image_offer        = var.vm_image_offer
  vm_image_sku          = var.vm_image_sku
  vm_image_version      = var.vm_image_version
  vm_shutdown_time      = var.vm_shutdown_time
  vm_shutdown_timezone  = var.vm_shutdown_timezone
  vm_shutdown_email     = var.vm_shutdown_email
}


#################################################

# module "cosmosdb" {
#   source = "./modules/CosmosDB"
# }





