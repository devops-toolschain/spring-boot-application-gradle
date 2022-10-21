locals {

  vm_name = "spring-app-vm"

  nsg_rules_range = {
    allow_ssh = {
        name                        = "allow-ssh"
        priority                    = "100"
        direction                   = "Inbound"
        access                      = "Allow"
        protocol                    = "Tcp"
        source_address_prefix       = "*"
        source_port_range           = "*"
        destination_address_prefix  = "*"
        destination_port_range      = "22"
        description                 = "Allow port 22"
    }

    allow_80 = {
        name                        = "allow-80"
        priority                    = "110"
        direction                   = "Inbound"
        access                      = "Allow"
        protocol                    = "Tcp"
        source_address_prefix       = "*"
        source_port_range           = "*"
        destination_address_prefix  = "*"
        destination_port_range      = "80"
        description                 = "Allow port 80"
    }

    allow_443 = {
        name                        = "allow-443"
        priority                    = "120"
        direction                   = "Inbound"
        access                      = "Allow"
        protocol                    = "Tcp"
        source_address_prefix       = "*"
        source_port_range           = "*"
        destination_address_prefix  = "*"
        destination_port_range      = "443"
        description                 = "Allow port 443"
    }
  }
}

variable "location" {
  type    = string
  default = "UK South"
}

variable "env" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    project = "Publicis"
  }
}