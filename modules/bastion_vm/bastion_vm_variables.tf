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


#######################

variable "admin_username" {
  type = string
}
variable "admin_password"{
    type=string
}
variable "vm_name" {
  type = string
}

variable "use_ssh_keys"{
  type=string
}
######################### nic variables.tf

variable "comp_name"{
  type=string
}
variable "vm_size"{
  type=string
}

variable "subnet_id"{
  type=string
}
variable "custom_data"{
  type=string
}