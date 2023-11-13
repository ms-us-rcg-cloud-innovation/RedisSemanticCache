
output "primary_access_key" {
  value     = azurerm_redis_enterprise_database.cache.primary_access_key
  sensitive = true
}
