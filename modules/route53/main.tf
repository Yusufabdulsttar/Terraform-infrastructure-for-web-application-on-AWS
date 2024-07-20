resource "aws_route53_zone" "main" {
  name = var.domain  
  tags = {
    Environment = "production"
  }
}

resource "aws_route53_record" "web_app" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain 
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}