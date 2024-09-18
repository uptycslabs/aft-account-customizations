locals {
  cspm_integration_aft = {
    external_id        = "1cfe95fd-6b84-441d-a691-0a163797742a"
    integrationPrefix  = "GiriAFTIntegrationRole"
  }
  cloudtrail_integration_aft = {
    "912326510691" = ["aws-cloudtrail-logs-794888992839-e26dd11a"]
  }
}

module "uptycs_aws_cspm_aft" {
  source             = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"
  upt_account_id     = "685272795239"
  external_id        = local.cspm_integration_aft.external_id
  integration_prefix = local.cspm_integration_aft.integrationPrefix
}

module "uptycs_aws_audit_logs_aft" {
  source                     = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/auditlog_integration/accounts"
  upt_account_id             = "685272795239"
  external_id                = local.cspm_integration_aft.external_id
  integration_prefix         = local.cspm_integration_aft.integrationPrefix
  cloudtrail_s3_bucket_names = lookup(local.cloudtrail_integration_aft, data.aws_caller_identity.current.account_id, [])
}
