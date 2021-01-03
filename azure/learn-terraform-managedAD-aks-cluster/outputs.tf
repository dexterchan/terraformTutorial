output "resource_group_name" {
  value = azurerm_resource_group.demo.name
}
output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.demo.name
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.demo.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.demo.kube_config_raw
}

output "principal_id" {
  value = azurerm_kubernetes_cluster.demo.identity.0.principal_id
}

output "tenant_id" {
  value = azurerm_kubernetes_cluster.demo.identity.0.tenant_id
}
