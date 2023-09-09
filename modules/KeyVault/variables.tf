variable "key_vault_name" {
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
  type        = string
}

variable "tenant_id" {
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
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

# variable "bypass" {
#   description = "(Optional) Specifies which traffic can bypass the network rules."
#   type        = string
#   default     = "AzureServices"
# }

# #
# variable "virtual_network_subnet_ids" {
#   description = "(Optional) One or more Subnet ID's which should be able to access this Key Vault."
#   default     = []
# }

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

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Key Vault"
  type        = map(string)
}

# variable "key_vault_access_policy" {
#   type = map(
#     object({
#       tenant_id               = string
#       object_id               = string
#       key_permissions         = list(string)
#       secret_permissions      = list(string)
#       certificate_permissions = list(string)
#     })
#   )
#   description = "(Optional) A map of objects that define the access policy for this Key Vault."
#   default     = {}
# }