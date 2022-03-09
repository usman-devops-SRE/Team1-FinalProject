# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.location}"
  address_space       = "${var.address_space}"
}
# Create subnets for all tiers
resource "azurerm_subnet" "subnet1" {
  name                 = "${var.subnet_name1}"
  resource_group_name  = "${var.rg_name}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = "${var.address_prefixes1}"
}
resource "azurerm_subnet" "subnet2" {
  name                 = "${var.subnet_name2}"
  resource_group_name  = "${var.rg_name}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = "${var.address_prefixes2}"
}
resource "azurerm_subnet" "subnet3" {
  name                 = "${var.subnet_name3}"
  resource_group_name  = "${var.rg_name}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = "${var.address_prefixes3}"
}

#Subnet for app service delegation
resource "azurerm_subnet" "subnet4" {
  name                 = "${var.subnet_name4}"
  resource_group_name  = "${var.rg_name}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = "${var.address_prefixes4}"
  
  delegation {
    name = "app-service-delegation"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

#Create Network Security Groups for each subnet
resource "azurerm_network_security_group" "nsg1" {
  name                = "${var.nsg_name1}"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  tags = "${var.tags}"
}
resource "azurerm_network_security_group" "nsg2" {
  name                = "${var.nsg_name2}"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  tags = "${var.tags}"
}
resource "azurerm_network_security_group" "nsg3" {
  name                = "${var.nsg_name3}"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  tags = "${var.tags}"
}




# Below Create association between NSG and Network Interface (moved to main.tf outside of module)
/*
resource "azurerm_network_interface_security_group_association" "nsg1_nic1_association" {
  network_interface_id      =  "${var.nic1_id}"  
  network_security_group_id =  azurerm_network_security_group.nsg1.id #"${var.nsg_id_1}"    
}
resource "azurerm_network_interface_security_group_association" "nsg2_nic2_association" {
  network_interface_id      =  "${var.nic2_id}"  
  network_security_group_id =  azurerm_network_security_group.nsg2.id #"${var.nsg_id_1}"    
}
resource "azurerm_network_interface_security_group_association" "nsg3_nic3_association" {
  network_interface_id      =  "${var.nic3_id}"  
  network_security_group_id =  azurerm_network_security_group.nsg3.id #"${var.nsg_id_1}"    
}
*/
