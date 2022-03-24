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
  dns_prefix          = "team1project3"

  private_cluster_enabled = true 
  private_dns_zone_id = "SystemAssigned"
  public_network_access_enabled = false

  default_node_pool {
    name           = var.node_pool_name
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = module.vnet1.subnet2_id
    #pod_subnet_id  = module.vnet1.subnet2_id #data.azurerm_subnet.subnet-2.id
    enable_node_public_ip = false
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


resource "azurerm_role_assignment" "example" {
  principal_id                     = azurerm_kubernetes_cluster.k8cluster_1.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.Team1P3ACR.id
  skip_service_principal_aad_check = true
  
  }