module "uptycs_aws_cspm_aft" {
  source             = "https://uptycs-terraform.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"
  upt_account_id     = "685272795239"
  integration_prefix = "GiriAFTIntegrationRole"  
  external_id        = "557a929b-39a5-4335-9fb0-c005f9cd44c3"
}

module "uptycs_aws_agentless_target_aft" {
  source = "https://uptycs-terraform.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/agentless_integration/target"
  integration_prefix = "GiriScannerIntegration"
  scanner_account_id = "646602658615"
}

module "uptycs_aws_agentless_target_aft_new" {
  source = "https://uptycs-terraform.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/agentless_integration/target"
  integration_prefix = "GiriNewScannerIntegration"
  scanner_account_id = "646602658615"
}
