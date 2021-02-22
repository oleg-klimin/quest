resource "aws_route53_record" "quest" {
  zone_id = var.dnsZoneId
  name    = "${var.subDomain}.${var.domain}"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_lb.questTfLB.dns_name]
}
