variable "lambda_function_name" {
  description = "The name of the Lambda function"
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function"
}

variable "api_name" {
  description = "The name of the API Gateway"
  default     = "my-api"
}

variable "stage_name" {
  description = "The name of the deployment stage"
  default     = "prod"
}

variable "region" {
  description = "AWS region"
}