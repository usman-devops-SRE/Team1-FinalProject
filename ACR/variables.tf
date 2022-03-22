variable "Team1P3ACR" {
  type        = string
  description = "Container registery name "
}
variable "resource_group_name" {
  type = string
  description = "resource group name for ACR"
}
variable "ACIrg" {
  type = string
  default = "acr-team-3rg"
  description = "resouce group varsname"
}
variable "location" {
  type        = string
  description = "Azure Resource Region Location"
}
 ####Kubernetes variables
 variable "k8s_rg1" {
   type = string
   description = "resource group for kubernetes"
 }
 variable "nodes_rg" {
   type = string
 }
 variable "ueNodesCluster" {
  type = string
  description = "cluster name"
}
variable "node_count" {
  type = number
  description = "number of nodes"
}

variable "node_pool_name" {
  type = string
  description = "name of the node pool"
}

variable "vm_size" {
  type = string
  description = "vm size for node pool"
}
variable "location2" {
  type = string
  description = "Second rg location"
}