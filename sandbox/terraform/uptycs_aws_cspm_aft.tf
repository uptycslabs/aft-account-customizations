module "uptycs_aws_cspm" {
  source             = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"
  upt_account_id     = "685272795239"
  integration_prefix = "GiriUptycsIntegrationRole"
  external_id        = "1cfe95fd-6b84-441d-a691-0a163797742a"
}
