resource "azurerm_resource_group" "app_rg" {
  name     = join("-", ["spring-boot-app-gradle-rg", var.env])
  location = var.location
}
