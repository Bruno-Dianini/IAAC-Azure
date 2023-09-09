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

variable "cs_nw_acl_action" {
  default = ""
}

variable "cs_nw_iprules" {
  default = ""
}

variable "cs_nw_subnet_rules" {
  type    = list(string)
  default = []
}

variable "functions_ips" {
  default = ""
}

variable "web_app_ips" {
  default = ""
}