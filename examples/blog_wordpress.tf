

module "bucket_wordpress" {
  source              = "github.com/ramonesc3po/tf-module-aws-s3-custom.git"
  bucket_name         = "logs"
  bucket_region       = "us-east-1"
  bucket_tier         = "production"
  bucket_organization = "zigzaga"

  policy_json = "${data.aws_iam_policy_document.bucket_wordpress.json}"

  versioning_is_enabled = "true"

  lifecycle_rule_is_enabled = "true"
}

module "cdn_wordpress" {
  source           = "../"
  aliases          = "www.zigzaga.com"
  cdn_tier         = "production"
  cdn_organization = "zigzaga"

  domain_name = "${module.bucket_wordpress.domain_name_bucket}"
  origin_id   = "${module.bucket_wordpress.id_bucket}"

  target_origin_id = "${module.bucket_wordpress.id_bucket}"
}
