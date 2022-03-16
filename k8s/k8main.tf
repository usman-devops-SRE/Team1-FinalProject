data "azurerm_subnet" "subnet-2" {
  name                 = "Tier2-subnet"
  virtual_network_name = "Vnet"
  resource_group_name  = "Net_RG"
}

resource "azurerm_resource_group" "k8s_rg1" {
  name     = var.k8s_rg1
  location = var.eastus
}

resource "azurerm_kubernetes_cluster" "k8cluster_1" {
  depends_on = [
    azurerm_resource_group.k8s_rg1
  ]
  name                = var.ueNodesCluster
  location            = var.eastus
  resource_group_name = azurerm_resource_group.k8s_rg1.name
  node_resource_group = var.nodes_rg
  dns_prefix = "team1project3"
  
  

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
    vnet_subnet_id = data.azurerm_subnet.subnet-2.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.k8cluster_1.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.k8cluster_1.kube_config_raw

  sensitive = true
}
