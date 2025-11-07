output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.aialpha_data.bucket
}

output "bucket_region" {
  description = "AWS region of the S3 bucket"
  value       = var.aws_region
}

output "lifecycle_rule_id" {
  description = "ID of the lifecycle rule"
  value       = aws_s3_bucket_lifecycle_configuration.lifecycle.rule[0].id
}
