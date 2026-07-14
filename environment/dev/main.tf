module "resource_group" {
  source         = "../../Child_module/azurerm_resource_group"
  resource_group = var.resource_group
}

module "virtual_network" {
  source          = "../../Child_module/azurerm_virtual_network"
  depends_on      = [module.resource_group]
  virtual_network = var.virtual_network
}

module "subnets" {
  source     = "../../Child_module/azurerm_Subnet"
  depends_on = [module.virtual_network]
  subnets    = var.subnets
}
module "public_ip" {
  source     = "../../Child_module/azurerm_pip"
  depends_on = [module.subnets]
  public_ip  = var.public_ip
}
module "bastion" {
  depends_on = [module.resource_group, module.virtual_network, module.subnets, module.public_ip]
  source     = "../../Child_module/azurerm_bastion"
  bastion    = var.bastion
}
