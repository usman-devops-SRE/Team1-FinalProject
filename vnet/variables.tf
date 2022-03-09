# Credentials/service principals for authentication
variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}


####################################################################
# PRIMARY REGION Virtual Network, Subnets, and NSG related variables 
variable "rg_name" {
  type    = string
  default = "Net_RG"
}
variable "location" {
  type    = string
  default = "East US 2"
}
variable "vnet_name" {
  type    = string
  default = "Vnet"
}
#Virtual networks address space
variable "address_space" {
  type    = list(string)
  default = ["10.110.0.0/16"]
}
#Names of network security groups
variable "nsg_name1" {
  type    = string
  default = "Tier1-NSG"
}
variable "nsg_name2" {
  type    = string
  default = "Tier2-NSG"
}
variable "nsg_name3" {
  type    = string
  default = "Tier3-NSG"
}

#Subnet names
variable "subnet_name1" {
  type    = string
  default = "Tier1-subnet"
}
variable "subnet_name2" {
  type    = string
  default = "Tier2-subnet"
}
variable "subnet_name3" {
  type    = string
  default = "Tier3-subnet"
}
variable "subnet_name4" {
  type    = string
  default = "app-service-delegation-subnet"
}
# Subnet addresses of tiers 1,2,3, and app service delegation subnet
variable "address_prefixes1" {
  type    = list(string)
  default = ["10.110.1.0/24"]
}
variable "address_prefixes2" {
  type    = list(string)
  default = ["10.110.2.0/24"]
}
variable "address_prefixes3" {
  type    = list(string)
  default = ["10.110.3.0/24"]
}
variable "address_prefixes4" {
  type    = list(string)
  default = ["10.110.4.0/24"]
}
variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
}


####################################################################
# SECONDARY REGION Virtual Network, Subnets, and NSG related variables. 
# Note: these variables are given default values to prevent repeated values from Primary to Secondary region
variable "rg_name_2" {
  type    = string
  default = "Net_RG2"
}
variable "location_2" {
  type    = string
  default = "West Europe"
}
variable "vnet_name_2" {
  type    = string
  default = "VNet2"
}
#Virtual networks address space
variable "address_space_2" {
  type    = list(string)
  default = ["10.111.0.0/16"]
}
#Names of network security groups
variable "nsg_name1_2" {
  type    = string
  default = "Tier1-NSG2"
}
variable "nsg_name2_2" {
  type    = string
  default = "Tier2-NSG2"
}
variable "nsg_name3_2" {
  type    = string
  default = "Tier3-NSG2"
}
#Subnet names
variable "subnet_name1_2" {
  type    = string
  default = "Tier1-subnet"
}
variable "subnet_name2_2" {
  type    = string
  default = "Tier2-subnet"
}
variable "subnet_name3_2" {
  type    = string
  default = "Tier3-subnet"
}
variable "subnet_name4_2" {
  type    = string
  default = "app-service-delegation-subnet"
}
# Subnet addresses of tiers 1,2,3, and app service delegation subnet
variable "address_prefixes1_2" {
  type    = list(string)
  default = ["10.111.1.0/24"]
}
variable "address_prefixes2_2" {
  type    = list(string)
  default = ["10.111.2.0/24"]
}
variable "address_prefixes3_2" {
  type    = list(string)
  default = ["10.111.3.0/24"]
}
variable "address_prefixes4_2" {
  type    = list(string)
  default = ["10.111.4.0/24"]
}



##### VNET PEERING VARIABLES
/*
variable "peering_name"{
    type=string
}
variable "remote_vnet_id"{
    type=string
}
*/





/*
variable "nic_id_1"{
    type=string
}
variable "nic_id_2"{
    type=string
}
variable "nic_id_3"{
    type=string
}*/