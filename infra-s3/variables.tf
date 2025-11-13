variable "aws_region" {
  type = string
  description = "AWS region for deployment"
  default     = "eu-west-1"
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket for AiAlpha data"
  default     = "kandidat-61-data"
}

variable "temporary_prefix" {
  type        = string
  description = "Prefix for temporary files"
  default     = "midlertidig/"
}

variable "glacier_transition_days" {
  type        = number
  description = "Days before moving temp files to Glacier"
  default     = 30
}

variable "expiration_days" {
  type        = number
  description = "Days before deleting temp files"
  default     = 60
}
