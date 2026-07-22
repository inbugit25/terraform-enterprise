resource "azurerm_resource_group" "rg" {

  name     = "rg-prod-core"
  location = "Central India"
}

module "network" {

  source = "../../modules/network"

  vnet_name           = "vnet-prod"
  subnet_name         = "subnet-prod-app"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "security" {

  source = "../../modules/security"

  nsg_name            = "prod-nsg"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "web01" {

  source = "../../modules/vm"

  vm_name             = "prod-web-01"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  subnet_id           = module.network.subnet_id

  vm_size             = "Standard_D4s_v5"

  admin_username      = "azureadmin"

  public_key_path     = "~/.ssh/id_rsa.pub"

  tags = {
    Environment = "Production"
    Application = "Portal"
    CostCenter  = "IT"
    Owner       = "Infrastructure"
    Backup      = "Enabled"
  }
}
