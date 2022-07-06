locals {
  origin_access_identity_comment = "Cloudfront origin access identity to restrict s3 access to only cloundfront"
}

module "deploy_cloudfront" {
  depends_on = [
    module.deploy_bucket
  ]

  source = "./modules/cloudfront"

  origin_access_comment          = local.origin_access_identity_comment
  domain_name                    = module.deploy_bucket.bucket_regional_domain_name
  enabled                        = true
  is_ipv6_enabled                = false
  comment                        = "Cloudfront distribution"
  default_root_object            = "index.html"
  allowed_methods                = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  cached_methods                 = ["GET", "HEAD"]
  query_string                   = false
  cookies                        = "none"
  viewr_protocol_policy          = "allow-all"
  min_ttl                        = 0
  max_ttl                        = 31536000
  default_ttl                    = 86400
  restriction_type               = "whitelist"
  locations                      = ["US", "DE"]
  cloudfront_default_certificate = true
}
