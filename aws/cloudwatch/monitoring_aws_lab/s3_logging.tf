# Bucket for access logs
resource "aws_s3_bucket" "access_logs" {
  bucket = "lab-s3-access-logs"
}

# Enable server access logging
resource "aws_s3_bucket_logging" "main_logs" {
  bucket = aws_s3_bucket.main.id
  target_bucket = aws_s3_bucket.access_logs.id
  target_prefix = "logs/"
}
