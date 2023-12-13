output "openai_api_key" {
  value = module.openai_api_key.openai_api_key
  sensitive = true
}