# PUBLIC IP
resource "azurerm_public_ip" "pubip" {
  name                = "${var.env}-${var.customer}-pubip-${var.workload}"
  resource_group_name = var.rgname
  location            = var.location
  sku                 = "Standard"
  allocation_method   = "Static"

  tags = {
    project = var.workload
    env     = var.env
  }
}



# NETWORK INTERFACE FOR VM
resource "azurerm_network_interface" "vm-nic" {
  count               = length(var.vm_names)
  name                = "${var.env}-${var.customer}-${var.vm_names[count.index]}-nic"
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "${var.env}-${var.customer}-${var.vm_names[count.index]}-nic-ip"
    subnet_id                     = var.subnet_ids
    private_ip_address_allocation = var.vm_priv_ip_conf
    public_ip_address_id = azurerm_public_ip.pubip.id
  }

  tags = {
    project = var.workload
    env     = var.env
  }
}

# VMS
resource "azurerm_windows_virtual_machine" "vm" {
  count                    = length(var.vm_names)
  name                     = "${var.env}-${var.customer}-${var.vm_names[count.index]}"
  resource_group_name      = var.rgname
  location                 = var.location
  size                     = var.vm_size
  admin_username           = var.vm_admins[count.index]
  admin_password           = "Admin#Amil2023#"
  enable_automatic_updates = true

  identity {
    type = var.vm_smi
  }

  network_interface_ids = [
    azurerm_network_interface.vm-nic[count.index].id
  ]

  os_disk {
    caching              = var.vm_os_caching
    storage_account_type = var.vm_os_storage_account
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  tags = {
    project = var.workload
    env     = var.env
  }
}

locals {
  vscode_script= try(file("C:\\Users\\henrique.nascimento\\OneDrive - Kumulus\\Desktop\\GERAL\\PROJETOS\\PROJETO AMIL\\IAC\\scripts\\installers.ps1"), null)
  vscode_base64EncodedScript = base64encode(local.vscode_script)
}

# SCRIPT TO INSTALL APPS IN THE VM
resource "azurerm_virtual_machine_extension" "apps_installer" {
  count                = length(var.vm_names)
  name                 = "${var.vm_names[count.index]}-apps-installer"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
  {
  "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${local.vscode_base64EncodedScript }')) | Out-File -filepath installers.ps1\" && powershell -ExecutionPolicy Bypass -File installers.ps1"
  }
  SETTINGS


  tags = {
    project = var.workload
    env     = var.env
  }
}


# AUTO SHUTDOWN VMS
resource "azurerm_dev_test_global_vm_shutdown_schedule" "vm_autoshutdown" {
  count              = length(var.vm_names)
  virtual_machine_id = azurerm_windows_virtual_machine.vm[count.index].id
  location           = var.location
  enabled            = true

  daily_recurrence_time = var.vm_shutdown_time
  timezone              = var.vm_shutdown_timezone

  notification_settings {
    enabled = true
    email   = var.vm_shutdown_email
  }
}