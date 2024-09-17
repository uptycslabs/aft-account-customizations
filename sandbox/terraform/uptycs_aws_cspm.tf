locals {
  account_customizations = {
    "cloudquery-root-management" = {
      integrationPrefix = "debug-11"
      externalId        = "012e935c-45a7-5c63-936d-924967513211"
    },
    "cqmanagement-account-1" = {
      integrationPrefix = "debug-22"
      externalId        = "012e935c-45a7-5c63-936d-924967513222"
    },
    "cqmanagement-account-2" = {
      integrationPrefix = "debug-33"
      externalId        = "012e935c-45a7-5c63-936d-924967513233"
    },
    "childaccount2" = {
      integrationPrefix = "debug-44"
      externalId        = "012e935c-45a7-5c63-936d-924967513244"
    },
    "childaccount3" = {
      integrationPrefix = "debug-55"
      externalId        = "012e935c-45a7-5c63-936d-924967513255"
    }
  }
}

module "uptycs_aws_cspm" {
  source             = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"
  for_each           = local.account_customizations

  upt_account_id     = "685272795239"
  integration_prefix = each.value.integrationPrefix
  external_id        = each.value.externalId
}
