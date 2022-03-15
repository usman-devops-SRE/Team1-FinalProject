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
 
resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                            = "${var.vm_name}"
  computer_name                   = "${var.comp_name}"
  resource_group_name             = "${var.rg_name}"
  location                        = "${var.location}"
  size                            = "${var.vm_size}"
  disable_password_authentication = "${var.use_ssh_keys}"#"false"
  admin_username                  = "${var.admin_username}"
  admin_password                  = "${var.admin_password}"
  /*
  boot_diagnostics {
    storage_account_uri = "${var.account_uri}"
  }*/
  network_interface_ids = [
    azurerm_network_interface.nic.id,#"${var.nic_id}",#
  ]
  os_disk {
    caching              ="ReadWrite" #"${var.caching}"
    storage_account_type = "Standard_LRS" #"${var.storage_account_type}"
  }

  source_image_reference {
    publisher = "Canonical" #"${var.publisher}"
    offer     = "UbuntuServer" #"${var.offer}"
    sku       = "18.04-LTS"  #"${var.image_sku}"
    version   = "latest"
  }
  #custom_data = "${var.custom_data}" = base64encode(data.local_file.script.content)


}

resource "azurerm_network_interface" "nic" {
  name                = "bastion_nic" #"${var.nic_name}"
  location            = "${var.location}"#azurerm_linux_virtual_machine.linux_vm.location#
  resource_group_name = "${var.rg_name}"#azurerm_linux_virtual_machine.linux_vm.resource_group_name#
  #network_interface_id = "${var.nic_id}"
  ip_configuration {
    name                          = "internal" #"${var.nic_ipconf_name}"#
    subnet_id                     = "${var.subnet_id}"#azurerm_subnet.bastion_subnet.id #"${var.nic_ipconf_subnetid}"#azurerm_subnet.subnet.id
    public_ip_address_id          = ""#azurerm_public_ip.bastion_public_ip.id #"${var.nic_ipconf_pip_addr}"#azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic" #"${var.nic_ipconf_priv_alloc}"#
  }
}
output "nic-id"{
  value = azurerm_network_interface.nic.id
}


