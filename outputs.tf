output "path_cloudfront_origin_access_identity" {
  value = "${aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path}"
}

output "iam_arn_cloudfront_origin_access_identity" {
  value = "${aws_cloudfront_origin_access_identity.default.iam_arn}"
}

output "arn_cloudfront_this" {
  value = "${aws_cloudfront_distribution.this.arn}"
}

output "id_cloudfront_this" {
  value = "${aws_cloudfront_distribution.this.id}"
}
