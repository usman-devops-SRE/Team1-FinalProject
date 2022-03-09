output "vnet_peering_id"{
    value = azurerm_virtual_network_peering.peering.id
}
output "vnet_peering_id_2"{
    value = azurerm_virtual_network_peering.peering2.id
}