locals {
  cspm_integration = {
    "646602658615" = {
      external_id        = "980b2db9-067e-5926-ae49-ba9022ee0e08",
      integration_prefix = "GiriUptycsIntegration"
  }
  default_values = {
    external_id        = "557a929b-39a5-4335-9fb0-c005f9cd44c3"
    integration_prefix = "UptycsIntegrationRole"
  }
  account_info = lookup(local.cspm_integration, data.aws_caller_identity.current.account_id, local.default_values)
}

module "uptycs_aws_cspm" {
  source             = "https://uptycs-terraform.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"
  upt_account_id     = "685272795239"
  external_id        = local.account_info.external_id
  integration_prefix = local.account_info.integration_prefix
}
