output "cloudfront_origin_access_identity_arn" {
  value = aws_cloudfront_origin_access_identity.cf_origin_identity.iam_arn
}
