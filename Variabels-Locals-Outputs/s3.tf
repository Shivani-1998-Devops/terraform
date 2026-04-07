# Random ID resource for S3 bucket suffix
# Generates a random 4-byte hex string to ensure unique bucket names
resource "random_id" "project_bucket_suffix" {
  byte_length = 4
}

# S3 bucket resource
# Creates an S3 bucket with a unique name using the random suffix
resource "aws_s3_bucket" "project_bucket" {
  bucket = "${local.project}-${random_id.project_bucket_suffix.hex}"

  tags = merge(local.common_tags, var.additional_tags)
}