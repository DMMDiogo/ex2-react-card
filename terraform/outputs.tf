output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.main.arn
}

output "bucket_region" {
  description = "The region of the S3 bucket"
  value       = aws_s3_bucket.main.region
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = aws_s3_bucket.main.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name"
  value       = aws_s3_bucket.main.bucket_regional_domain_name
}

output "versioning_enabled" {
  description = "Whether versioning is enabled"
  value       = aws_s3_bucket_versioning.main.versioning_configuration[0].status
}

output "logging_bucket_id" {
  description = "The ID of the logging bucket (if enabled)"
  value       = var.enable_access_logging ? aws_s3_bucket.logging[0].id : null
}

output "lifecycle_rules_enabled" {
  description = "Whether lifecycle rules are enabled"
  value       = var.enable_lifecycle_rules
}
