resource_group = {
  rg1 = {
    name     = "devrg1"
    location = "centralindia"
  }
   rg2 = {
    name     = "devrg2"
    location = "centralindia"
  }
}

virtual_network = {
  vnet1 = {
    name                = "dev_vnet"
    location            = "centralindia"
    resource_group_name = "devrg1"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  snet1 = {
    name                 = "frontend_subnet"
    resource_group_name  = "devrg1"
    virtual_network_name = "dev_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "backend_subnet"
    resource_group_name  = "devrg1"
    virtual_network_name = "dev_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  AzureBastionSubnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "devrg1"
    virtual_network_name = "dev_vnet"
    address_prefixes     = ["192.168.1.224/27"]
  }
}
public_ip = {
  pip = {
    name                = "TestPublicIp"
    resource_group_name = "devrg1"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}
bastion = {
  azurerm_bastion = {
    name                = "azurebastion"
    location            = "centralindia"
    resource_group_name = "devrg1"

    ip_configuration = {
      name                 = "configuration"
      subnet_id            = "/subscriptions/67f3a31e-83d6-4c1e-95f0-2f64212b3f96/resourceGroups/devrg1/providers/Microsoft.Network/virtualNetworks/dev_vnet/subnets/AzureBastionSubnet"
      public_ip_address_id = "/subscriptions/67f3a31e-83d6-4c1e-95f0-2f64212b3f96/resourceGroups/devrg1/providers/Microsoft.Network/publicIPAddresses/TestPublicIp"
    }
  }
}
