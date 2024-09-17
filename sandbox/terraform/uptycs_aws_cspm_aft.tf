locals {
  uptycs_integration = {
    scannerAccountId   = "794888992839"
    external_id        = "1cfe95fd-6b84-441d-a691-0a163797742a"
    integrationPrefix  = "GiriAFTIntegrationRole"
  }  // Update above values as required
}

module "uptycs_aws_agentless_target_aft" {
  source = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/agentless_integration/target"
  scanner_account_id = local.uptycs_integration.scannerAccountId
  integration_prefix = local.uptycs_integration.integrationPrefix
}

module "uptycs_aws_cspm_aft" {
  source             = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"
  upt_account_id     = "685272795239"
  external_id        = local.uptycs_integration.external_id
  integration_prefix = local.uptycs_integration.integrationPrefix
}
