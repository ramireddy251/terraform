resource "aws_route53_zone" "roboshop" {
  name = var.domain_name
}

resource "aws_route53_record" "records" {
  for_each = aws_instance.example
  zone_id = aws_route53_zone.roboshop.id
  # interpolation
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [each.value.private_ip]
  allow_overwrite = true
}
