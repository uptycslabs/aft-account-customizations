
locals {
  external_ids = {
    "646602658615" = "012e935c-45a7-5c63-936d-924967513211",
    "924967513276" = "012e935c-45a7-5c63-936d-924967513222",
    "496028668001" = "012e935c-45a7-5c63-936d-924967513233",
    "912326510691" = "012e935c-45a7-5c63-936d-924967513244",
    "051315720372" = "012e935c-45a7-5c63-936d-924967513255"
    }
}



module "uptycs_aws_cspm" {
  source             = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"

  upt_account_id     = "685272795239"
  integration_prefix = "debug-aft-uptycs-cspm"
  external_id        = local.external_ids[data.aws_caller_identity.current.account_id]
}
