# resource "azurerm_resource_group" "app_rg" {
#   name     = join("-", ["spring-boot-app-gradle-rg", var.env])
#   location = var.location
# }

resource "azurerm_resource_group" "app_rg" {
  name     = join("-", ["pub-rg", var.env])
  location = var.location
}