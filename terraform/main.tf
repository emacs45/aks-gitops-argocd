data "azurerm_resource_group" "lab" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-gitops-argocd"
  location            = data.azurerm_resource_group.lab.location
  resource_group_name = data.azurerm_resource_group.lab.name
  dns_prefix          = "aks-gitops-argocd"
  sku_tier            = "Free"

  default_node_pool {
    name            = "system"
    node_count      = 2
    vm_size         = "Standard_D4s_v5"
    os_disk_size_gb = 64
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    project     = "aks-gitops-argocd"
    environment = "lab"
    managed_by  = "terraform"
  }
}
