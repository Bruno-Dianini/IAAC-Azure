variable "storageaccount_name" {
  type    = string
  default = ""
}

variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

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

variable "default_action" {
  type    = string
  default = "Deny"
}


variable "ip_rules" {
  type = list(string)

}

variable "virtual_network_subnet_ids" {
  type = list(string)

}

variable "is_hns_enabled" {
  type = string
}


variable "access_tier" {
  type = string
}