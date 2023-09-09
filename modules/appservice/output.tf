output "functions_ips" {
  value = distinct(flatten(azurerm_linux_function_app.function[*].possible_outbound_ip_address_list))
}

