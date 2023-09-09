# COGNITIVE SERVICES LANGUAGE, COMPUTER VISION, CUSTOM VISION AND FORMS RECOGNIZER
resource "azurerm_cognitive_account" "cognitive_services" {
  count                 = length(var.cs_names)
  name                  = "${var.env}-${var.customer}-${var.cs_names[count.index]}-${var.workload}"
  location              = var.location
  resource_group_name   = var.rgname
  kind                  = var.cs_kinds[count.index]
  custom_subdomain_name = "${var.env}-${var.workload}-${var.customer}-${var.cs_names[count.index]}"
  sku_name              = var.cs_skus[count.index]

  identity {
    type = var.cs_id_type
  }

  # network_acls {
  #   default_action = var.cs_nw_acl_action
  #   ip_rules       = var.cs_nw_iprules

  #   virtual_network_rules {
  #     subnet_id                            = var.cs_nw_subnet_rules[0]
  #     ignore_missing_vnet_service_endpoint = false
  #   }

  #   virtual_network_rules {
  #     subnet_id                            = var.cs_nw_subnet_rules[1]
  #     ignore_missing_vnet_service_endpoint = false
  #   }
  # }

  tags = {
    project = var.workload
    env     = var.env
  }
}

# # COGNITIVE SERVICES PRIVATE ENDPOINTS
# resource "azurerm_private_endpoint" "cognitive_services-endpoint" {
#   count               = length(var.cs_names)
#   name                = "${var.env}${var.customer}${var.cs_names[count.index]}-endpoint"
#   resource_group_name = var.rgname
#   location            = var.location
#   subnet_id           = var.cs_nw_subnet_rules[0]
#   private_service_connection {
#     name                           = "${var.env}${var.customer}${var.cs_names[count.index]}-connection"
#     private_connection_resource_id = azurerm_cognitive_account.cognitive_services[count.index].id
#     is_manual_connection           = false
#     subresource_names              = ["account"]
#   }
# }