variable "workspace_name" {
  description = "(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists."
  type        = string
}
variable "workspace_rg_name" {
  description = "(Required) The name of the resource group in which the Log Analytics workspace is created."
  type        = string
}
variable "workspace_sku" {
  description = "(Optional) Specifies the Sku of the Log Analytics Workspace. Possible values are 'Free', 'PerNode', 'Premium', 'Standard', 'Standalone', 'Unlimited', 'CapacityReservation', and 'PerGB2018'. Defaults to 'PerGB2018'."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = number
  default     = 30
}
variable "daily_quota_gb" {
  description = "(Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
  type        = number
  default     = -1
}
variable "internet_ingestion_enabled" {
  description = "(Optional) Should the Log Analytics Workflow support ingestion over the Public Internet? Defaults to 'true'."
  type        = bool
  default     = true
}
variable "internet_query_enabled" {
  description = "(Optional) Should the Log Analytics Workflow support querying over the Public Internet? Defaults to 'true'."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "queries" {
  description = "List of queries to be deployed"
  type = map(object({
    name         = string      # (Required) Specifies the name of the Log Analytics Saved Search.
    category     = string      # (Required) The category that the Saved Search will be listed under.
    display_name = string      # (Required) The name that Saved Search will be displayed as.
    query        = string      # (Required) The query expression for the saved search.
    tags         = map(string) # A mapping of tags which should be assigned to the Logs Analytics Saved Search.
  }))
}