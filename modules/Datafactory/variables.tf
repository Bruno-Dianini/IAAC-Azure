
variable "resource_group_name" {
  type    = string
  default = ""
}
variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "datafactory" {
  type = string
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

variable "storage_connection" {}
variable "key_id" {}