
# MACHINE LEARNING WORKSPACE
resource "azurerm_machine_learning_workspace" "ml-workspaces" {
  name                          = "${var.env}-${var.workload}-${var.customer}-ml"
  location                      = var.location
  resource_group_name           = var.rgname
  friendly_name                 = "${var.env}-${var.workload}-${var.customer}-ml"
  application_insights_id       = var.application_insights_id
  key_vault_id                  = var.key_vault_id
  storage_account_id            = var.storage_account_id
  public_network_access_enabled = true

  identity {
    type = var.type
  }

  tags = {
    project = var.workload
    env     = var.env
  }
  # depends_on = [var.this_depends_on]
}


# # MACHINE LEARNING VM GPUS AND PIPELINE RUNS
# resource "azurerm_machine_learning_compute_cluster" "mlcluster" {
#   name                          = "${var.env}${var.workload}${var.ml_cluster_name}"
#   location                      = var.location
#   machine_learning_workspace_id = azurerm_machine_learning_workspace.ml-workspaces.id
#   vm_size                       = var.ml_vm_cluster_size
#   vm_priority                   = var.vm_priority
#   # subnet_resource_id            = var.subnet_id

#   identity {
#     type = "SystemAssigned"
#   }

#   scale_settings {
#     min_node_count                       = var.min_cluster_nodes
#     max_node_count                       = var.max_cluster_nodes
#     scale_down_nodes_after_idle_duration = var.time_to_scale_down
#   }

#   tags = {
#     project = var.workload
#     env     = var.env
#   }

#   depends_on = [azurerm_machine_learning_workspace.ml-workspaces]
# }

# resource "azurerm_monitor_diagnostic_setting" "mlworkspacediag" {
#   name                       = "${var.env}-${var.workload}-${var.customer}-ml-logs"
#   target_resource_id         = azurerm_machine_learning_workspace.ml-workspaces.id
#   log_analytics_workspace_id = var.log_analytics_workspace_id
#   log {
#     category = "AmlComputeCpuGpuUtilization"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "ModelsChangeEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "ComputeInstanceEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DataStoreChangeEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DataStoreReadEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DataSetChangeEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DataSetReadEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "AmlComputeClusterEvent"
#     enabled  = false
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "AmlComputeClusterNodeEvent"
#     enabled  = false
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "AmlComputeJobEvent"
#     enabled  = false
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "AmlRunStatusChangedEvent"
#     enabled  = false
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "ModelsReadEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "ModelsActionEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DeploymentReadEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DeploymentEventACI"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DeploymentEventAKS"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "InferencingOperationAKS"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "InferencingOperationACI"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "EnvironmentChangeEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "EnvironmentReadEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DataLabelChangeEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "DataLabelReadEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "PipelineChangeEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "PipelineReadEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "RunEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   log {
#     category = "RunReadEvent"
#     retention_policy {
#       enabled = false
#     }
#   }
#   metric {
#     category = "AllMetrics"
#     retention_policy {
#       enabled = false
#     }
#   }
#   depends_on = [azurerm_machine_learning_workspace.ml-workspaces]
# }