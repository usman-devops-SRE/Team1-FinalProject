variable "Team1P3ACR" {
  type        = string
  description = "Container registery name "
  default = "Team1P3ACR"
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
  default = "East Us"
}
