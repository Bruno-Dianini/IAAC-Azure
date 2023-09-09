variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}
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

variable "tags" {
  type = map(string)
}


