variable "Team1P3ACR" {
  type        = string
  description = "Container registery name "
  default = "Team1P3ACR"
}
variable "resource_group_name" {
  type = string
  description = "resource group name for ACR"
  default = "acr-team-3rg"
}

variable "location-Acr" {
  type        = string
  description = "Azure Resource Region Location"
  default = "East Us"
}

variable "secrets" {
  default = "${secrets.ACCESS_TOKEN}"
}
