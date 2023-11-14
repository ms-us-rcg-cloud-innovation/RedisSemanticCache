resource "random_string" "name" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_redis_enterprise_cluster" "cache" {
  name                = "${var.name}-${random_string.name.result}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_name = "Enterprise_E10-2"

}

resource "azurerm_redis_enterprise_database" "cache" {
  name              = "default"
  cluster_id        = azurerm_redis_enterprise_cluster.cache.id
  clustering_policy = "EnterpriseCluster"
  eviction_policy   = "NoEviction"
  module {
    name = "RediSearch"
  }
}