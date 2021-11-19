resource "azurerm_resource_group" "app_rg" {
  name     = "spring-boot-app-rg"
  location = var.location
}
