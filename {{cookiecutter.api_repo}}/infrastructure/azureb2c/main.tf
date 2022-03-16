resource "random_uuid" "api_scope_id" {}

resource "azuread_application" "api" {
  display_name = "api"
  identifier_uris = ["api://api-service"]

  app_role {
    allowed_member_types = ["User"]
    description          = "ReadOnly roles have limited read access"
    display_name         = "ReadOnly"
    enabled              = true
    id                   = "497406e4-012a-4267-bf18-45a1cb148a01"
    value                = "User"
  }

  api {
    mapped_claims_enabled          = true
    requested_access_token_version = 2

    # known_client_applications = [
    #   azuread_application.spa_app2.application_id
    # ]
 
    oauth2_permission_scope {
      admin_consent_description  = "Access api as a user"
      admin_consent_display_name = "Access api as a user"
      id                         = random_uuid.api_scope_id.result
      enabled                    = true
      type                       = "Admin"
      user_consent_description   = "Access api as a user"
      user_consent_display_name  = "Access api as a user"
      value                      = "access_as_user"
    }
  }
}

resource "azuread_service_principal" "api_principle" {
  application_id               = azuread_application.api.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.main.object_id]
}

resource "azuread_application_password" "api" {
  application_object_id = azuread_application.api.object_id
}
