locals {
  cspm_integration = {
    "646602658615" = {
      external_id        = "c161b4cc-b028-5e18-b2cb-7a81e37db881",
      integration_prefix = "GiriUptycsIntegration"
    },
    "496028668001" = {
      external_id        = "68eb48ff-46be-5405-b824-3e2f40a70d04",
      integration_prefix = "GiriUptycsIntegration"
    },
    "912326510691" = {
      external_id        = "af776340-5d83-5f05-99b1-4fd60691e641",
      integration_prefix = "GiriUptycsIntegration-TF"
    },
    "051315720372" = {
      external_id        = "22b7a8fb-f07d-5cd3-91b6-8efecdcdd25e",
      integration_prefix = "GiriUptycsIntegration-TF"
    }
  }
  cloudtrail_integration = {
    "912326510691" = ["aws-cloudtrail-logs-794888992839-e26dd11a"]
  }
  default_values = {
    external_id        = "1cfe95fd-6b84-441d-a691-0a163797742a",
    integration_prefix = "UptycsIntegrationRole"
  }
  account_info = lookup(local.cspm_integration, data.aws_caller_identity.current.account_id, local.default_values)
}

module "uptycs_aws_cspm" {
  source             = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"

  upt_account_id     = "685272795239"
  integration_prefix = local.account_info.integration_prefix
  external_id        = local.account_info.external_id
}


module "uptycs_aws_audit_logs" {
  source                     = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/auditlog_integration/accounts"
  upt_account_id             = "685272795239"
  external_id                = local.cspm_integration.external_id
  integration_prefix         = local.cspm_integration.integrationPrefix
  cloudtrail_s3_bucket_names = lookup(local.cloudtrail_integration, data.aws_caller_identity.current.account_id, [])
}

module "uptycs_aws_agentless_target" {
  source = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/agentless_integration/target"
  scanner_account_id = "794888992839"
  integration_prefix = local.cspm_integration.integrationPrefix
}
