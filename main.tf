variable "applications" {
  type = list(string)
}

module "aci_single_bd_single_epg" {
  for_each =  toset(var.applications)
  source = "../modules/tfe_aci_single_bd_single_epg"
  application_name = each.key
  oauth_token_id = var.oauth_token_id
  tfe_organization_name = var.tfe_organization_name
  tfe_agent_pool_name = var.tfe_agent_pool_name
} 