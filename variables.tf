variable "env" {
  type    = string
  default = ""
}
variable "customer" {
  type    = string
  default = ""
}
variable "tenantid" {
  type    = string
  default = ""
}
variable "workload" {
  type    = string
  default = ""
}
// RG

variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}


// Variables Vnet

variable "vnet-name" {
  type = string
}

variable "vnet-sng" {
  type = string
}

variable "sbnet-name-1" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "address_prefix" {
  type = list(string)

}

// StorageAccount 001

variable "account_tier" {
  type    = string
  default = ""
}

variable "account_replication_type" {
  type    = string
  default = ""
}

variable "tags" {
  type = map(string)

}

variable "storageaccount_name" {
  type    = string
  default = ""
}
variable "default_action" {
  type = string

}


variable "ip_rules" {
  type = list(string)

}

variable "is_hns_enabled" {
  type = string
}

variable "access_tier" {
  type = string
}

// StorageAccount 002

variable "account_tier002" {
  type    = string
  default = ""
}

variable "account_replication_type002" {
  type    = string
  default = ""
}


variable "storageaccount_name002" {
  type    = string
  default = ""
}
variable "default_action002" {
  type = string

}


variable "ip_rules002" {
  type = list(string)

}

variable "is_hns_enabled002" {
  type = string
}

variable "access_tier002" {
  type = string
}

// StorageAccount 003

variable "account_tier003" {
  type    = string
  default = ""
}

variable "account_replication_type003" {
  type    = string
  default = ""
}


variable "storageaccount_name003" {
  type    = string
  default = ""
}
variable "default_action003" {
  type = string

}


variable "ip_rules003" {
  type = list(string)

}

variable "is_hns_enabled003" {
  type = string
}

variable "access_tier003" {
  type = string
}

// StorageAccount 004

variable "account_tier004" {
  type    = string
  default = ""
}

variable "account_replication_type004" {
  type    = string
  default = ""
}


variable "storageaccount_name004" {
  type    = string
  default = ""
}
variable "default_action004" {
  type = string

}


variable "ip_rules004" {
  type = list(string)

}

variable "is_hns_enabled004" {
  type = string
}

variable "access_tier004" {
  type = string
}


//Keyvault
variable "key_vault_name" {
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created."
  type        = string
}


variable "sku_name" {
  description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  type        = string
  default     = "standard"
}

variable "enabled_for_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false"
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = bool
  default     = false
}

variable "enable_rbac_authorization" {
  description = "(Optional) Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. "
  type        = bool
  default     = false
}

variable "environment" {
  description = "(Required) Environment where the Key Vault will be deployed"
  type        = string
}

variable "purge_protection_enabled" {
  description = "(Optional) Is Purge Protection enabled for this Key Vault? "
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "(Optional) The number of days that items should be retained for once soft-deleted"
  type        = number
  default     = 7
}



//Datafactory


variable "datafactory" {
  type    = string
  default = ""
}

variable "datalinked" {
  type    = string
  default = ""
}
variable "datapipeline" {
  type    = string
  default = ""
}
variable "datakey" {
  type    = string
  default = ""
}


############## AKS
variable "aks_enabled" {
  default = 0
}

variable "aksinstancesize" {
  default = ""
}

variable "networkaks" {
  default = ""
}

variable "skulbaks" {
  default = ""
}

variable "default_node_pool_name" {
  default = ""
}

variable "registry-enabled" {
  default = 0
}

variable "aks_network_policy" {
  default = ""
}

variable "max_pods" {
  default = ""
}

variable "node_count" {
  default = ""
}

variable "id_type" {
  default = ""
}

variable "aks_availability_zones" {
  default = ""
}

variable "aks_os_disk_size_gb" {
  default = ""
}

#################################
# MACHINE LEARNING
#################################

variable "ml_workspace_type" {
  default = ""
}


variable "ml_vm_cluster_size" {
  default = ""
}

variable "vm_priority" {
  default = ""
}

variable "min_cluster_nodes" {
  default = ""
}

variable "max_cluster_nodes" {
  default = ""
}

variable "time_to_scale_down" {
  default = ""
}

variable "ml_vm_authorization_type" {
  default = ""
}



variable "ml_cluster_name" {
  default = ""
}


############### COGNITIVE SERVICES

variable "cs_names" {
  type    = list(string)
  default = []
}

variable "cs_kinds" {
  type    = list(string)
  default = []
}

variable "cs_skus" {
  type    = list(string)
  default = []
}

variable "cs_id_type" {
  default = ""
}

############### APP INSIGHTS
variable "app_type" {
  default = ""
}

############### APP SERVICES

variable "fa_names" {
  type    = list(string)
  default = []
}

variable "apps_os_type" {
  default = ""
}

variable "apps_sku_name" {
  default = ""
}

variable "fa_identity_type" {
  default = ""
}

variable "fa_logs_size" {
  default = ""
}

variable "fa_retention_logs" {
  default = ""
}

variable "fa_py_version" {
  default = ""
}

variable "functions_app_settings" {
  type = map(string)
  default = {}
}

variable "web_app_settings" {
  type = map(string)
  default = {}
}

variable "fa_tags" {
  type    = list(string)
  default = []
}

############### COSMOS DB

variable "cosmos_offer_type" {
  default = ""
}

variable "cosmos_consistency_level" {
  default = ""
}

variable "cosmos_failover_prio" {
  default = ""
}

variable "cosmos_backup_interval" {
  default = ""
}

variable "cosmos_backup_retention" {
  default = ""
}

variable "cosmosdb_throughput" {
  default = ""
}

variable "cosmos_ip_filter" {
  default = ""
}


variable "cosmos_bkp_type" {
  default = ""
}
############### VM

variable "vm_names" {
  type    = list(string)
  default = []
}

variable "vm_admins" {
  type    = list(string)
  default = []
}

variable "vm_size" {
  default = ""
}

variable "vm_priv_ip_conf" {
  default = ""
}

variable "vm_os_caching" {
  default = ""
}

variable "vm_os_storage_account" {
  default = ""
}

variable "vm_image_publisher" {
  default = ""
}

variable "vm_image_offer" {
  default = ""
}

variable "vm_image_sku" {
  default = ""
}

variable "vm_image_version" {
  default = ""
}

variable "vm_smi" {
  default = ""
}

variable "vm_shutdown_time" {
  default = ""
}

variable "vm_shutdown_timezone" {
  default = ""
}

variable "vm_shutdown_email" {
  default = ""
}

variable "bastion_sku" {
  default = ""
}

variable "bastion_scale" {
  default = ""
}

# variable "cs_nw_acl_action" {
#   default = ""
# }

# variable "cs_nw_iprules" {
#   default = ""
# }

