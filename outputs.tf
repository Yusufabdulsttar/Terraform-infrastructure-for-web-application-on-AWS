output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "public_subnet_sg" {
  value = module.security_group.public_subnet_sg
}

output "private_subnet_sg" {
  value = module.security_group.private_subnet_sg
}

output "db_security_group" {
  value = module.security_group.db_security_group
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "bucket_id" {
  value = module.s3.bucket_id
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}

output "db_instance_id" {
  value = module.rds.db_instance_id
}

output "db_instance_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "route53_record_id" {
  value = module.route53.route53_record_id
}

output "route53_record_fqdn" {
  value = module.route53.route53_record_fqdn
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda.lambda_function_arn
}

output "api_invoke_url" {
  value = module.api_gateway.api_invoke_url
}
