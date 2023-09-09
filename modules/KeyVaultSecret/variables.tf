variable "key_vault_id" {
  description = "(Required) The ID of the Key Vault where the Secret should be created."
  type        = string
}

variable "secret_name" {
  description = "(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
  type        = string
}

variable "secret_value" {
  description = "(Required) Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
  type        = string
}