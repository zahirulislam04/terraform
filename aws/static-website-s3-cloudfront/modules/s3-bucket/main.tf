# create bucket
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
}
