locals {
  common_tags = {
    Terraform    = true
    Organization = "${var.cdn_organization}"
    Tier         = "${var.cdn_tier}"
  }
}

resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "${var.aliases}"
}

resource "aws_cloudfront_distribution" "this" {
  enabled             = "${var.is_enabled}"
  comment             = "${var.comment}"
  aliases             = ["${var.aliases}"]
  default_root_object = "${var.default_root_object}"
  is_ipv6_enabled     = "${var.is_ipv6_enabled}"
  http_version        = "${var.http_version}"
  price_class         = "${var.price_class}"
  web_acl_id          = "${var.web_acl_id}"
  retain_on_delete    = "${var.retain_on_delete}"

  ordered_cache_behavior = "${var.ordered_cache_behavior}"

  custom_error_response = ["${var.custom_error_response}"]

  "default_cache_behavior" {
    allowed_methods = "${var.default_allowed_methods}"
    cached_methods  = "${var.default_cached_methods}"
    compress        = "${var.compress_enabled}"

    default_ttl = "${var.default_ttl}"
    max_ttl     = "${var.max_ttl}"
    min_ttl     = "${var.min_ttl}"

    target_origin_id = "${var.target_origin_id}"

    viewer_protocol_policy = "${var.viewer_protocol_policy}"

    "forwarded_values" {
      headers      = ["${var.forward_headers}"]
      query_string = "${var.forward_query_string}"

      "cookies" {
        forward           = "${var.forward_cookies}"
        whitelisted_names = ["${var.forward_cookies_whitelisted_names}"]
      }
    }
  }

  "origin" {
    domain_name = "${var.domain_name}"
    origin_id   = "${var.origin_id}"
    origin_path = "${var.origin_path}"

    custom_origin_config {
      http_port              = "${var.custom_origin_http_port}"
      https_port             = "${var.custom_origin_https_port}"
      origin_protocol_policy = "${var.custom_origin_protocol_policy}"
      origin_ssl_protocols   = "${var.custom_origin_ssl_protocols}"
    }
  }

  "restrictions" {
    "geo_restriction" {
      restriction_type = "${var.geo_restriction_type}"
      locations        = "${var.geo_restriction_locations}"
    }
  }

  "viewer_certificate" {
    cloudfront_default_certificate = "${var.acm_certificate_arn == "" ? true : false}"
    acm_certificate_arn            = "${var.acm_certificate_arn}"
    ssl_support_method             = "${var.ssl_support_method}"
    minimum_protocol_version       = "${var.minimum_protocol_version}"
  }

  tags = "${merge(local.common_tags, var.tags,map("Name", var.aliases))}"
}
