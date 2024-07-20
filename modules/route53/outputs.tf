output "route53_record_id" {
  value = aws_route53_record.web_app.id
}

output "route53_record_fqdn" {
  value = aws_route53_record.web_app.fqdn
}