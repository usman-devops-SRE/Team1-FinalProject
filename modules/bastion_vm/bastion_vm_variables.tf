variable "bastion_address"{
    type = list(string)
}
variable "vnet_name"{
    type = string
}
variable "location"{
    type = string
}
variable "rg_name"{
    type = string
}

variable "account_uri"{
  type = string
}
variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
#######################
variable "nic_name" {
  type = string
}

variable "storage_account_type" {
  type = string
}

variable "admin_username" {
  type = string
}
variable "admin_password"{
    type=string
}

variable "vm_size" {
  type = string
}

variable "vm_name" {
  type = string
}


variable "caching"{
  type=string
}#"ReadWrite"
variable "publisher"{
  type=string
}#"Canonical"
variable "offer"{
  type=string
}#"UbuntuServer"
variable "image_sku"{
  #"18.04-LTS"
  type=string
}
variable "use_ssh_keys"{
  type=string
}
######################### nic variables.tf
variable "nic_ipconf_name"{
  #"internal"
  type=string
}
variable "nic_ipconf_subnetid"{
  type=string
  #azurerm_subnet.subnet.id
}
variable "nic_ipconf_pip_addr"{
  #azurerm_public_ip.pip.id
  type=string
}
variable "nic_ipconf_priv_alloc"{
  type=string
}
variable "custom_data"{
  type=string
}
variable "comp_name"{
  type=string
}