
module "deploy_bucket" {
  source      = "./modules/s3-bucket"
  bucket_name = var.bucket_name
}

module "enable_bucket_permission" {
  depends_on = [
    module.deploy_cloudfront,
    module.deploy_bucket
  ]

  source                  = "./modules/s3-bucket-permission"
  actions                 = ["s3:GetObject"]
  resources               = ["${module.deploy_bucket.bucket_arn}/*"]
  principals_type         = "AWS"
  principals_identifiers  = [module.deploy_cloudfront.cloudfront_origin_access_identity_arn]
  bucket_id               = module.deploy_bucket.bucket_id
  acl                     = "private"
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

module "enable_s3_static_website_config" {
  depends_on = [
    module.deploy_bucket
  ]

  source                = "./modules/s3-bucket-website"
  bucket_id             = module.deploy_bucket.bucket_id
  index_document_suffix = "index.html"
  error_document_key    = "error.html"
}
