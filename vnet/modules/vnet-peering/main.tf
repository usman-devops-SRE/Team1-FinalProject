resource "azurerm_virtual_network_peering" "peering" {
  name                         = "${var.peering_name}"#"peering-to-${element(azurerm_virtual_network.vnet.*.name, 1 - count.index)}"
  resource_group_name          = "${var.rg_name}"#element(azurerm_resource_group.vnet.*.name, count.index)
  virtual_network_name         = "${var.vnet_name}"#element(azurerm_virtual_network.vnet.*.name, count.index)
  remote_virtual_network_id    = "${var.remote_vnet_id}"#element(azurerm_virtual_network.vnet.*.id, 1 - count.index)
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
}

resource "azurerm_virtual_network_peering" "peering2" {
  name                         = "${var.peering_name2}"#"peering-to-${element(azurerm_virtual_network.vnet.*.name, 1 - count.index)}"
  resource_group_name          = "${var.rg_name2}"#element(azurerm_resource_group.vnet.*.name, count.index)
  virtual_network_name         = "${var.vnet_name2}"#element(azurerm_virtual_network.vnet.*.name, count.index)
  remote_virtual_network_id    = "${var.remote_vnet_id2}"#element(azurerm_virtual_network.vnet.*.id, 1 - count.index)
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
}