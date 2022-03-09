#Subnet IDs of tier1, tier2, and tier3 subnets.

output "subnet1_id"{
  value = azurerm_subnet.subnet1.id
}
output "subnet2_id"{
  value = azurerm_subnet.subnet2.id
}
output "subnet3_id"{
  value = azurerm_subnet.subnet3.id
}

#Subnet4 is service delegation subnet
output "subnet4-id"{
  value = azurerm_subnet.subnet4.id
}



# NSG names and IDs for the associated subnets
output "nsg1_name"{
  value = azurerm_network_security_group.nsg1.name
}
output "nsg2_name"{
  value = azurerm_network_security_group.nsg2.name
}
output "nsg3_name"{
  value = azurerm_network_security_group.nsg3.name
}
output "nsg1_id"{
  value = azurerm_network_security_group.nsg1.id
}
output "nsg2_id"{
  value = azurerm_network_security_group.nsg2.id
}
output "nsg3_id"{
  value = azurerm_network_security_group.nsg3.id
}

#VNET ID 
output "vnet_id"{
    value = azurerm_virtual_network.vnet.id
}
output "vnet_name"{
    value = azurerm_virtual_network.vnet.name
}