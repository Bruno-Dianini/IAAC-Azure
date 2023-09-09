variable "env" {
  default = ""
}

variable "customer" {
  default = ""
}

variable "workload" {
  default = ""
}

variable "location" {
  default = ""
}

variable "rgname" {
  default = ""
}

variable "tenant_id" {
  default = ""
}

variable "apps_os_type" {
  default = ""
}

variable "apps_sku_name" {
  default = ""
}

variable "fa_names" {
  type    = list(string)
  default = []
}

variable "fa_appi_key" {
  default = ""
}

variable "fa_appi_cns" {
  default = ""
}

variable "fa_appi_id" {
  default = ""
}

variable "fa_py_version" {
  default = ""
}

variable "fa_logs_size" {
  default = ""
}

variable "fa_retention_logs" {
  default = ""
}

variable "fa_storage" {
  default = ""
}

variable "fa_identity_type" {
  default = ""
}

variable "fa_storage_use_key" {
  default = ""
}

variable "fa_app_storage_key" {
  default = ""
}

variable "subnet_ids" {
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