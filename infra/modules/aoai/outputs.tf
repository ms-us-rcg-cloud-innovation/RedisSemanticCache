output "openai_api_key" {
  value = azurerm_cognitive_account.aoai.primary_access_key
  sensitive = true
}