resource "random_id" "bucket_suffix" {
  byte_length = 4
}
resource "aws_s3_bucket" "static_website" {
  bucket = "my-static-website-${random_id.bucket_suffix.hex}"
}
resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket                  = aws_s3_bucket.static_website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = aws_s3_bucket.static_website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_website.arn}/*"
      }
    ]
  })
  depends_on = [aws_s3_bucket_public_access_block.static_website]
}
resource "aws_s3_bucket_website_configuration" "static_website_config" {
  bucket = aws_s3_bucket.static_website.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "index.html"
  source       = "build/index.html"
  etag         = filemd5("build/index.html")
  content_type = "text/html"
}
resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "error.html"
  source       = "build/error.html"
  etag         = filemd5("build/error.html")
  content_type = "text/html"
}
resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "style.css"
  source       = "build/style.css"
  etag         = filemd5("build/style.css")
  content_type = "text/css"
}
resource "aws_s3_object" "image_b1" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "b1.jfif"
  source       = "build/b1.jfif"
  etag         = filemd5("build/b1.jfif")
  content_type = "image/jpeg"
}
resource "aws_s3_object" "image_s1" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "s1.jfif"
  source       = "build/s1.jfif"
  etag         = filemd5("build/s1.jfif")
  content_type = "image/jpeg"
}
resource "aws_s3_object" "image_s3" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "s3.jfif"
  source       = "build/s3.jfif"
  etag         = filemd5("build/s3.jfif")
  content_type = "image/jpeg"
}
resource "aws_s3_object" "image_s4" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "s4.jfif"
  source       = "build/s4.jfif"
  etag         = filemd5("build/s4.jfif")
  content_type = "image/jpeg"
}