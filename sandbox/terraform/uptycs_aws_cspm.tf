module "uptycs_aws_cspm" {
  source             = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"

  upt_account_id     = "685272795239"
  integration_prefix = "debug-aft-uptycs-cspm"
  external_id        = "ed93345d-4f92-488a-89a1-42ae16d3b8a5"
}
