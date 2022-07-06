# local variables
locals {
  s3_origin_id = "myS3Origin"
}

# create cloudfront origin access identitz
resource "aws_cloudfront_origin_access_identity" "cf_origin_identity" {
  comment = var.origin_access_comment
}

# Create cloudfront distribution
resource "aws_cloudfront_distribution" "cf_distribution" {
  depends_on = [
    aws_cloudfront_origin_access_identity.cf_origin_identity
  ]

  origin {
    domain_name = var.domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cf_origin_identity.cloudfront_access_identity_path
    }
  }

  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  default_root_object = var.default_root_object

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = var.query_string

      cookies {
        forward = var.cookies
      }
    }

    viewer_protocol_policy = var.viewr_protocol_policy
    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
      locations        = var.locations
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate
  }

  tags = {
    created_by   = var.tags.created_by,
    created_date = var.tags.created_date,
    environment  = var.tags.environment,
    description  = var.tags.description
  }
}
