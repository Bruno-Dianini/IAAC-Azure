#AKS cluster
resource "azurerm_kubernetes_cluster" "clusterkubernetes" {
  name                = "k8s-${var.workload}-${var.region}-${var.env}-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.env}-${var.workload}"

  default_node_pool {
    name               = var.default_node_pool_name
    vm_size            = var.aksinstancesize
    node_count         = var.node_count
    max_pods           = var.max_pods
    vnet_subnet_id     = var.subnet_id
    availability_zones = var.aks_availability_zones
    os_disk_size_gb    = var.aks_os_disk_size_gb
  }

  identity {
    type = var.id_type
  }

  network_profile {
    network_policy    = var.aks_network_policy
    network_plugin    = var.networkaks
    load_balancer_sku = var.skulbaks
  }

  tags = {
    project = var.tag
    env     = var.env
  }

  depends_on = [var.app_depends_on]
}

resource "azurerm_monitor_diagnostic_setting" "aksworkspacediag" {
  name                       = "${var.workload}${var.region}${var.env}-aks-workspace-diag-logs"
  target_resource_id         = azurerm_kubernetes_cluster.clusterkubernetes.id
  log_analytics_workspace_id = var.loganalytics_workspace_id

  log {
    category = "kube-apiserver"
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-audit"
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-audit-admin"
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-controller-manager"
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-scheduler"
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "cluster-autoscaler"
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "cloud-controller-manager"
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "guard"
    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = false
    }
  }

  depends_on = [azurerm_kubernetes_cluster.clusterkubernetes]
}

