variable "bucket_name" {
  description = "Name of the S3 bucket"
}

variable "environment" {
  description = "Environment tag for the S3 bucket"
  default     = "development"
}

