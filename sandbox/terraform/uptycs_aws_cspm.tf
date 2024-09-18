locals {
  cspm_integration = {
    "646602658615" = {
      external_id        = "980b2db9-067e-5926-ae49-ba9022ee0e08",
      integration_prefix = "GiriUptycsIntegration"
    },
    "924967513276" = {
      external_id        = "8d79586f-6b93-5422-9916-c27ed417eb19",
      integration_prefix = "GiriUptycsIntegration"
    },
    "496028668001" = {
      external_id        = "2ff0c7dc-0fab-5027-a9f4-ff888ac0f8e5",
      integration_prefix = "GiriUptycsIntegration"
    },
    "912326510691" = {
      external_id        = "88c48bbc-d242-56f9-b2f5-5bcd89ea7c1d",
      integration_prefix = "GiriUptycsIntegration-TF"
    },
    "051315720372" = {
      external_id        = "cbc60ed9-c4bc-5f29-bf14-878526f81ef2",
      integration_prefix = "GiriUptycsIntegration-TF"
    }
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
