resource "aws_cloudwatch_dashboard" "lab_dashboard" {
  dashboard_name = "Lab-Monitoring-Dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type       = "metric"
        x          = 0
        y          = 0
        width      = 12
        height     = 6
        properties = {
          metrics = [
            [ "AWS/Lambda", "Errors",    "FunctionName", aws_lambda_function.producer.function_name ],
            [ ".",          "Duration",  ".",            ".", { stat = "Average" } ]
          ]
          period = 60
          title  = "Producer Lambda Errors & Duration"
        }
      },
      {
        type       = "metric"
        x          = 12
        y          = 0
        width      = 12
        height     = 6
        properties = {
          metrics = [
            [ "AWS/SQS", "ApproximateNumberOfMessagesVisible", "QueueName", aws_sqs_queue.queue.name ],
            [ ".",       "ApproximateAgeOfOldestMessage",       ".",         "." ]
          ]
          period = 60
          title  = "SQS Queue Metrics"
        }
      },
      {
        type       = "metric"
        x          = 0
        y          = 6
        width      = 24
        height     = 6
        properties = {
          metrics = [
            [ "AWS/S3", "4xxErrors", "BucketName", aws_s3_bucket.main.bucket, { stat = "Sum" } ],
            [ ".",      "5xxErrors", ".",         ".",                        { stat = "Sum" } ]
          ]
          period = 300
          title  = "S3 Error Metrics"
        }
      }
    ]
  })
}
