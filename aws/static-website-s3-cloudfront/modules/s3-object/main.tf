
# upload index.html to bucket
resource "aws_s3_object" "object" {
  bucket       = var.bucket_id
  key          = var.object_key
  source       = var.file_path
  acl          = var.acl
  content_type = var.content_type
  etag         = filemd5(var.file_path)
}
