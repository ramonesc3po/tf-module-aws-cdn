output "path_cloudfront_origin_access_identity" {
  value = "${aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path}"
}
