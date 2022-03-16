data "azuread_client_config" "main" {}

# data "terraform_remote_state" "state" {
#   backend = "local"

#   config = {
#     path = "/Users/jameswilson/service_api/terraform.tfstate"
#   }
# }