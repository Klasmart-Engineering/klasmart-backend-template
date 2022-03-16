output "tenant_id" {
  value = data.azuread_client_config.main.tenant_id
}

output "api_client_id" {
  value = azuread_application.api.application_id
}

output "api_object_id" {
  value = azuread_application.api.object_id
}

output "api_scope_id" {
  value = random_uuid.api_scope_id.result
}

output "api_client_secret" {
  value     = azuread_application_password.api.value
  sensitive = true
}

output "api_scopes" {
  value = azuread_application.api.api.0.oauth2_permission_scope
}
# output "api_scopes" {
#   value = local.api_scopes
# }