
# Bucket policy document
data "aws_iam_policy_document" "s3_iam_policy" {
  statement {
    actions   = var.actions
    resources = var.resources

    principals {
      type        = var.principals_type
      identifiers = var.principals_identifiers
    }
  }
}

# Attach policy to bucket
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = var.bucket_id
  policy = data.aws_iam_policy_document.s3_iam_policy.json
}

# Set bucket acl private
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = var.bucket_id
  acl    = var.acl
}

# block all public access to bucket
resource "aws_s3_bucket_public_access_block" "bucket_block_public_access" {
  bucket = var.bucket_id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  restrict_public_buckets = var.restrict_public_buckets
  ignore_public_acls      = var.ignore_public_acls
}
