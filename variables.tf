variable "is_enabled" {
  description = "Set false if you do not  want cdn to be create"
  default     = true
}

variable "aliases" {
  description = "(Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution"
  type        = "list"
  default     = []
}

variable "ordered_cache_behavior" {
  description = "(Optional) - An ordered list of cache behaviors resource for this distribution. List from top to bottom. In order of precedence. The topmost cache behavior will have precedence 0."
  type        = "list"
  default     = []
}

variable "custom_error_response" {
  description = "List of the custom error response"
  type        = "list"
  default     = []
}

variable "comment" {
  description = "(Optional) - Any comments you want to include about the distribution."
  default     = "This comment is the standard of the CDN"
}

variable "default_allowed_methods" {
  description = "(Required) - Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
  type        = "list"
}

variable "default_cached_methods" {
  description = "(Required) - Controls whether CloudFront caches the response to requests using the specified HTTP methods."
  type        = "list"
}

variable "compress_enabled" {
  description = "(Optional) - Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header (default: false)."
  default     = true
}

variable "default_ttl" {
  description = "(Optional) - The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. Defaults to 1 day."
  default     = "60"
}

variable "forward_headers" {
  description = "(Optional) - Specifies the Headers, if any, that you want CloudFront to vary upon for this cache behavior. Specify * to include all headers."
  type        = "list"
  default     = []
}

variable "forward_query_string" {
  description = "(Required) - Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior."
  default     = false
}

variable "forward_cookies" {
  description = "(Required) - Specifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted_names"
  default     = "none"
}

variable "forward_cookies_whitelisted_names" {
  description = "(Optional) - If you have specified whitelist to forward, the whitelisted cookies that you want CloudFront to forward to your origin."
  type        = "list"
  default     = []
}

variable "max_ttl" {
  description = "(Optional) - The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers. Defaults to 365 days."
  default     = "31536000"
}

variable "min_ttl" {
  description = "(Optional) - The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds."
  default     = "0"
}

variable "target_origin_id" {
  description = "(Required) - The value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior."
}

variable "default_root_object" {
  description = "(Optional) - The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  default     = ""
}

variable "is_ipv6_enabled" {
  description = "(Optional) - Whether the IPv6 is enabled for the distribution"
  default     = false
}

variable "http_version" {
  description = "(Optional) - The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2."
  default     = "http2"
}

variable "price_class" {
  description = "(Optional) - The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  default     = "PriceClass_100"
}

variable "web_acl_id" {
  description = "(Optional) - If you're using AWS WAF to filter CloudFront requests, the Id of the AWS WAF web ACL that is associated with the distribution."
  default     = ""
}

variable "retain_on_delete" {
  description = "(Optional) - Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards. Default: false."
  default     = false
}

variable "domain_name" {
  description = "(Required) - The DNS domain name of either the S3 bucket, or web site of your custom origin."
}

variable "origin_id" {
  description = "(Required) - A unique identifier for the origin."
}

variable "origin_path" {
  description = "(Optional) - An optional element that causes CloudFront to request your content from a directory in your Amazon S3 bucket or your custom origin."
  default     = ""
}

variable "viewer_protocol_policy" {
  description = "(Required) - Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https."
  default     = "redirect-to-https"
}

variable "geo_restriction_type" {
  description = "(Required) - The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
  default     = "none"
}

variable "geo_restriction_locations" {
  description = "(Optional) - The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)."
  type        = "list"
  default     = []
}

variable "acm_certificate_arn" {
  description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. Specify this, cloudfront_default_certificate, or iam_certificate_id. The ACM certificate must be in US-EAST-1."
  default     = ""
}

variable "ssl_support_method" {
  description = "Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only. Required if you specify acm_certificate_arn or iam_certificate_id. NOTE: vip causes CloudFront to use a dedicated IP address and may incur extra charges."
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018. Default: TLSv1. NOTE: If you are using a custom certificate (specified with acm_certificate_arn or iam_certificate_id), and have specified sni-only in ssl_support_method, TLSv1 or later must be specified. If you have specified vip in ssl_support_method, only SSLv3 or TLSv1 can be specified. If you have specified cloudfront_default_certificate, TLSv1 must be specified."
  default     = "TLSv1.2_2018"
}

variable "custom_origin_http_port" {
  description = "(Required) - The HTTP port the custom origin listens on."
  default     = 0
}

variable "custom_origin_https_port" {
  description = "(Required) - The HTTPS port the custom origin listens on."
  default     = 0
}

variable "custom_origin_protocol_policy" {
  description = "(Required) - The origin protocol policy to apply to your origin. One of http-only, https-only, or match-viewer."
  default     = "match-viewer"
}

variable "custom_origin_ssl_protocols" {
  description = "(Required) - The SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. A list of one or more of SSLv3, TLSv1, TLSv1.1, and TLSv1.2."
  type        = "list"
  default     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
}

variable "cdn_tier" {
  description = "Define which environment will be applied. Example staging, production, integration"
}

variable "cdn_organization" {
  description = ""
  default     = ""
}

variable "tags" {
  description = "Add extra tags with map"
  type        = "map"
  default     = {}
}
