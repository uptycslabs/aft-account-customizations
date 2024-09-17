
locals {
  external_ids = {
    "646602658615" = "c161b4cc-b028-5e18-b2cb-7a81e37db881",
    "924967513276" = "f5eb7b3f-152d-5fce-ab80-6ad3c95f25de",
    "496028668001" = "68eb48ff-46be-5405-b824-3e2f40a70d04",
    "912326510691" = "af776340-5d83-5f05-99b1-4fd60691e641",
    "051315720372" = "22b7a8fb-f07d-5cd3-91b6-8efecdcdd25e"
    }
    default_external_id = "68eb48ff-46be-5405-b824-3e2f40a70d04"
    external_id = external_ids[data.aws_caller_identity.current.account_id]==null?local.default_external_id:external_ids[data.aws_caller_identity.current.account_id]
}



module "uptycs_aws_cspm" {
  source             = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"

  upt_account_id     = "685272795239"
  integration_prefix = "debug-aft-uptycs-cspm"
  external_id        = local.external_id
}
