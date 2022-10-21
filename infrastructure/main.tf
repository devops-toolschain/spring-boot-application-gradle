# resource "azurerm_resource_group" "app_rg" {
#   name     = join("-", ["spring-boot-app-gradle-rg", var.env])
#   location = var.location
# }

locals {
  vm_name = "spring-app-vm"
}

module "pub_rg" {
  source   = "github.com/devops-toolschain/azure-terraform-modules.git//az-resource-group"
  name     = "pub"
  location = var.location
  tags     = var.tags
}

module "pub_vnet" {
  source              = "github.com/devops-toolschain/azure-terraform-modules.git//az-vnet"
  name                = "pub"
  resource_group_name = module.pub_rg.name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
  tags                = var.tags
}

module "pub_vnet_subnet" {
  source               = "github.com/devops-toolschain/azure-terraform-modules.git//az-vnet-subnet"
  name                 = "pub"
  resource_group_name  = module.pub_rg.name
  virtual_network_name = module.pub_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

module "pub_nsg" {
  source               = "github.com/devops-toolschain/azure-terraform-modules.git//az-nsg-vm"
  resource_group_name  = module.pub_rg.name
  location             = var.location
  virtual_machine_name = local.vm_name
  tags                 = var.tags
}

# module "vm_nsg_rules" {
#   source                      = "../../../modules/tf-az-nsg-security-rule"
#   resource_group_name         = data.azurerm_resource_group.resource_group.name
#   network_security_group_name = module.vm_nsg.name
#   nsg_rules_prefix_range      = local.vm_nsg_rules_range
# }


# # Create a NIC a Primary IP and multiple secondary IPs
# module "vm_nic" {
#   source                        = "../../../modules/tf-az-vm-nic"
#   virtual_machine_name          = var.vm_name[terraform.workspace]
#   resource_group_name           = data.azurerm_resource_group.resource_group.name
#   location                      = data.azurerm_resource_group.resource_group.location
#   network_security_group_id     = module.vm_nsg.id
#   subnet_id                     = data.azurerm_subnet.subnet.id
#   private_ip_address            = null
#   private_ip_address_allocation = "Dynamic"
#   public_ip_address_id          = null
#   enable_accelerated_networking = "false"
#   #secondary_private_ips         = var.secondary_private_ips[terraform.workspace] # Create one or more secondary IPs
#   tags                          = local.tags
# }

# # Create Virtual Machine
# module "vm" {
#   source = "../../../modules/tf-az-vm-linux"

#   # Common configuration
#   resource_group_name = data.azurerm_resource_group.resource_group.name
#   location            = data.azurerm_resource_group.resource_group.location
#   vm_name             = var.vm_name[terraform.workspace]

#   # NIC configurtion
#   network_interface_ids = [module.vm_nic.id]
#    #zones                       = ["1"] # Zones must not be set if availability set is required
#    #availability_set_id           = module.vm_availability_set.id
#    #proximity_placement_group_id  = module.vm_ppg.id

#   # VM configuration
#   vm_size                 = var.vm_size[terraform.workspace]
#   storage_os_disk         = var.storage_os_disk[terraform.workspace]
#   storage_data_disk       = var.storage_data_disk[terraform.workspace]
#   storage_image_reference = var.storage_image_reference
#   vm_account_credentials  = local.vm_account_credentials
#   boot_diagnostics_config = local.boot_diagnostics_config
#   #zones                   = var.zones[terraform.workspace]
#   tags                    = local.tags
# }

# # Create VM Extensions
# module "vm_extensions" {
#     source                  = "../../../modules/tf-az-vm-linux-extensions"
#     template_file_path      = "../../../modules/tf-az-vm-linux-extensions"
#     virtual_machine_names   = [module.vm.vm_name]
#     virtual_machine_ids     = [module.vm.vm_id]

#     symantec_agent_config   = local.symantec_agent_config

#     disk_encryption_config  = local.disk_encryption_config
#     diagnostic_agent_config =  local.diagnostic_agent_config
#     dependency_agent_config = local.dependency_agent_config
#     rapid7_agent_config     = local.rapid7_agent_config

#     log_analytics_workspace = local.log_analytics_workspace
# }
