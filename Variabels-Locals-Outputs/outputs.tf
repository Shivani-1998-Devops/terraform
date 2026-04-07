# Output for S3 bucket name
# Exports the name of the created S3 bucket (marked as sensitive)
output "s3_bucket_name" {
  value       = aws_s3_bucket.project_bucket.bucket
  sensitive   = true
  description = "The name of the S3 bucket"
}

# Output for sensitive variable
# Exports the sensitive variable value for demonstration
output "sensitive_var" {
  sensitive = true
  value     = var.my_sensitive_value
}