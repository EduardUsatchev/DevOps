output "jenkins_address" {
  value = "http://${aws_instance.web[*].public_ip}:8080"
}