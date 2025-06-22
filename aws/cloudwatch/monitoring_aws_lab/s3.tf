resource "aws_s3_bucket" "main" {
  bucket = "lab-s3-bucket"
}

resource "aws_s3_bucket_notification" "notify" {
  bucket = aws_s3_bucket.main.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.producer.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
