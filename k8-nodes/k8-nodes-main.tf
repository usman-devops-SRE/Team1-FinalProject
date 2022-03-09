resource "azurerm_resource_group" "k8nodes_rg1" {
  name     = var.k8nodes_rg1
  location = var.eastus
}

resource "azurerm_kubernetes_cluster" "k8cluster_1" {
  name                = var.ueNodesCluster
  location            = var.eastus
  resource_group_name = azurerm_resource_group.k8nodes_rg1.name
  dns_prefix          = "k8nodes1"
  

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  service_principal {
    client_id     = "0000-00000"
    client_secret = "000000000000000000"
  }
}

