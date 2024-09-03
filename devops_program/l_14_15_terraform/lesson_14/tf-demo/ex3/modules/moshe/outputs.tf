output "public_ip" {
  value = "${aws_instance.web.ami} ${aws_instance.web[*].public_ip} ${aws_instance.web.id}"
}
