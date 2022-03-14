resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "${var.rg_name}"
  virtual_network_name = "${var.vnet_name}"#azurerm_virtual_network.example.name
  address_prefixes     = "${var.bastion_address}" #subnet
}

resource "azurerm_public_ip" "bastion_public_ip" {
  name                = "bastion_public_ip"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "Vnet_bastion"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_public_ip.id
  }
}
