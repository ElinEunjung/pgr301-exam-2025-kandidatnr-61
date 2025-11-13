variable "aws_region" {
  description = "AWS region for deployment"
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for AiAlpha data"
  type        = string
  default     = "kandidat-61-data"
}

variable "temporary_prefix" {
  description = "Prefix for temporary files"
  default     = "midlertidig/"
}

variable "transition_days" {
  description = "Days before moving temp files to Glacier"
  default     = 30
}

variable "expiration_days" {
  description = "Days before deleting temp files"
  default     = 60
}
