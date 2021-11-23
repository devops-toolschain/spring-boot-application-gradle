resource "azurerm_resource_group" "app_rg" {
  name     = "spring-boot-app-gradle-rg"
  location = var.location
}
