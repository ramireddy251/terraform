resource "aws_route53_zone" "roboshop" {
  name = var.domain_name
}

resource "aws_route53_record" "records" {
  count = 10  
  zone_id = aws_route53_zone.roboshop.id
  # interpolation
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.example[count.index].private_ip]
}

# roboshop.ramireddy.co.in -> public ip
resource "aws_route53_record" "records2" {
  zone_id = aws_route53_zone.roboshop.id
  # interpolation
  name    = "roboshop.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.example[index(var.instances, "frontend")].public_ip]
}
