# enable static website configuration
resource "aws_s3_bucket_website_configuration" "config" {
  bucket = var.bucket_id
  index_document {
    suffix = var.index_document_suffix
  }

  error_document {
    key = var.error_document_key
  }
}
