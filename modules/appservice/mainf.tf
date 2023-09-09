# SERVICE PLAN FUNCTIONS
resource "azurerm_service_plan" "service-plan" {
  name                = "${var.env}-${var.customer}-service-plan-${var.workload}"
  resource_group_name = var.rgname
  location            = var.location
  os_type             = var.apps_os_type
  sku_name            = var.apps_sku_name

  tags = {
    project = var.workload
    env     = var.env
  }
}

# FUNCTIONS
resource "azurerm_linux_function_app" "function" {
  count               = length(var.fa_names)
  name                = "${var.env}-${var.customer}-${var.fa_names[count.index]}-${var.workload}"
  resource_group_name = var.rgname
  location            = var.location
  service_plan_id     = azurerm_service_plan.service-plan.id
  #virtual_network_subnet_id = var.subnet_ids[1]

  identity {
    type = var.fa_identity_type
  }

  storage_account_name       = var.fa_storage
  storage_account_access_key = var.fa_storage_use_key
  builtin_logging_enabled    = false

  app_settings =  merge({ "SourceStorageConnection" = format("%s", var.fa_app_storage_key) }, var.functions_app_settings)

  site_config {
    application_insights_key               = var.fa_appi_key
    application_insights_connection_string = var.fa_appi_cns
    always_on                              = false

    app_service_logs {
      disk_quota_mb         = var.fa_logs_size
      retention_period_days = var.fa_retention_logs
    }

    application_stack {
      python_version = var.fa_py_version
    }
  }

  tags = {
    project = var.workload
    env     = var.env
    "${var.fa_tags[0]}" = "${var.fa_appi_cns}"
    "${var.fa_tags[1]}" = "${var.fa_appi_key}"
    "${var.fa_tags[2]}" = "${var.fa_appi_id}"
  }

  lifecycle {
    ignore_changes = [ tags ]
  }
}

