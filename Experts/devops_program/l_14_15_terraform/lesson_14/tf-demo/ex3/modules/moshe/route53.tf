resource "aws_route53_record" "a" {
  zone_id = "moshe"
  records = [aws_instance.web.private_ip]
  name = "aa"
  type = "A"
  depends_on = [aws_instance.web]
  lifecycle {
    ignore_changes = [records]
  }
}