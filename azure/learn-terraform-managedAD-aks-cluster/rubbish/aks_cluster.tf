/*
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West US 2"
}

data "azurerm_client_config" "current" {
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "examplecluster1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_A2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_user_assigned_identity" "test" {
  name                = "${azurerm_kubernetes_cluster.example.name}-agentpool"
  resource_group_name = azurerm_kubernetes_cluster.example.node_resource_group
}

resource "azurerm_container_registry" "acr" {
  name                = "humblepigmktdatasvcemulator"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_role_assignment" "acrpull_role" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = data.azurerm_user_assigned_identity.test.principal_id
  skip_service_principal_aad_check = true
}
*/
