
module "deploy_objects" {
  depends_on = [
    module.deploy_bucket
  ]

  source   = "./modules/s3-object"
  for_each = fileset("${path.module}/html", "*")

  bucket_id    = module.deploy_bucket.bucket_id
  object_key   = each.value
  file_path    = "${path.module}/html/${each.value}"
  acl          = "public-read"
  content_type = "text/html"
}
