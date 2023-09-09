## ----- Environment Variables ----- ##

variable "rg_name" {
  description = "(Required) The name of the resource group in which to create the Synapse Analytics."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "storage" {
  description = "Storage account name"
  type        = string
}