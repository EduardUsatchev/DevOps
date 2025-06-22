# Producer Lambda (triggered by S3, logs & pushes to SQS)
resource "aws_lambda_function" "producer" {
  function_name    = "lab_lambda_producer"
  filename         = "lambda_producer.zip"
  source_code_hash = filebase64sha256("lambda_producer.zip")
  handler          = "lambda_producer.handler"
  runtime          = "python3.9"
  role             = aws_iam_role.lambda_exec.arn
}

# Allow S3 → Producer
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.producer.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.main.arn
}

# Consumer Lambda (triggered by SQS)
resource "aws_lambda_function" "consumer" {
  function_name    = "lab_lambda_consumer"
  filename         = "lambda_consumer.zip"
  source_code_hash = filebase64sha256("lambda_consumer.zip")
  handler          = "lambda_consumer.handler"
  runtime          = "python3.9"
  role             = aws_iam_role.lambda_exec.arn
}

resource "aws_lambda_event_source_mapping" "consumer_mapping" {
  event_source_arn  = aws_sqs_queue.queue.arn
  function_name     = aws_lambda_function.consumer.arn
  batch_size        = 10
}
