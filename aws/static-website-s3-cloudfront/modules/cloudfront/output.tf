output "cloudfront_origin_access_identity_arn" {
  value = aws_cloudfront_origin_access_identity.cf_origin_identity.iam_arn
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.cf_distribution.domain_name
}
