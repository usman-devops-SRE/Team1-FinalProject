resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}
resource "azurerm_resource_group" "rg2" {
  name     = var.rg_name_2
  location = var.location_2
}

module "vnet1" {
  source            = "./modules/vnet_nsg_subnets"
  rg_name           = azurerm_resource_group.rg.name
  location          = var.location
  vnet_name         = var.vnet_name
  address_space     = var.address_space
  subnet_name1      = var.subnet_name1
  subnet_name2      = var.subnet_name2
  subnet_name3      = var.subnet_name3
  subnet_name4      = var.subnet_name4 #"appservice-subnet"
  address_prefixes1 = var.address_prefixes1
  address_prefixes2 = var.address_prefixes2
  address_prefixes3 = var.address_prefixes3
  address_prefixes4 = var.address_prefixes4
  nsg_name1         = var.nsg_name1
  nsg_name2         = var.nsg_name2
  nsg_name3         = var.nsg_name3

  tags = var.tags

}

module "vnet2" {
  source            = "./modules/vnet_nsg_subnets"
  rg_name           = azurerm_resource_group.rg2.name
  location          = var.location_2
  vnet_name         = var.vnet_name_2
  address_space     = var.address_space_2
  subnet_name1      = var.subnet_name1_2
  subnet_name2      = var.subnet_name2_2
  subnet_name3      = var.subnet_name3_2
  subnet_name4      = var.subnet_name4_2 #"appservice-subnet"
  address_prefixes1 = var.address_prefixes1_2
  address_prefixes2 = var.address_prefixes2_2
  address_prefixes3 = var.address_prefixes3_2
  address_prefixes4 = var.address_prefixes4_2
  nsg_name1         = var.nsg_name1_2
  nsg_name2         = var.nsg_name2_2
  nsg_name3         = var.nsg_name3_2

  tags = var.tags
}

module "vnet_peering" {
  source          = "./modules/vnet-peering"
  peering_name    = "${module.vnet1.vnet_name}-to-${module.vnet2.vnet_name}"
  peering_name2   = "${module.vnet2.vnet_name}-to-${module.vnet1.vnet_name}"
  rg_name         = azurerm_resource_group.rg.name
  rg_name2        = azurerm_resource_group.rg2.name
  vnet_name       = module.vnet1.vnet_name
  remote_vnet_id  = module.vnet2.vnet_id
  vnet_name2      = module.vnet2.vnet_name
  remote_vnet_id2 = module.vnet1.vnet_id

}
