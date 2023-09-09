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

variable "subnet_ids" {
  default = ""
}

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

variable "vm_priv_ip_conf" {
  default = ""
}

