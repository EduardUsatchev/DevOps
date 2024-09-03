output "jenkins_address" {
  value = var.env == "prod" ? "http://${aws_instance.web.public_ip}:8080" : ""
}