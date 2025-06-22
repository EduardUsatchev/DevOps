# Error alarm for Producer Lambda
resource "aws_cloudwatch_metric_alarm" "producer_errors" {
  alarm_name          = "producer-errors-alarm"
  alarm_description   = "Errors > 1 in 5m"
  namespace           = "AWS/Lambda"
  metric_name         = "Errors"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 1
  period              = 300
  evaluation_periods  = 1
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

# Duration alarm for Producer Lambda
resource "aws_cloudwatch_metric_alarm" "producer_duration" {
  alarm_name          = "producer-duration-alarm"
  alarm_description   = "Avg Duration > 1000ms"
  namespace           = "AWS/Lambda"
  metric_name         = "Duration"
  statistic           = "Average"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 1000
  period              = 60
  evaluation_periods  = 1
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

# SQS visible messages alarm
resource "aws_cloudwatch_metric_alarm" "sqs_visible" {
  alarm_name          = "sqs-visible-msgs-alarm"
  alarm_description   = "VisibleMsgs > 1000"
  namespace           = "AWS/SQS"
  metric_name         = "ApproximateNumberOfMessagesVisible"
  dimensions = {
    QueueName = aws_sqs_queue.queue.name
  }
  statistic           = "Average"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 1000
  period              = 60
  evaluation_periods  = 1
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

# SQS oldest message age alarm
resource "aws_cloudwatch_metric_alarm" "sqs_oldest" {
  alarm_name          = "sqs-oldest-msg-alarm"
  alarm_description   = "OldestMsgAge > 300s"
  namespace           = "AWS/SQS"
  metric_name         = "ApproximateAgeOfOldestMessage"
  dimensions = {
    QueueName = aws_sqs_queue.queue.name
  }
  statistic           = "Average"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 300
  period              = 60
  evaluation_periods  = 1
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

# S3 4xx errors alarm
resource "aws_cloudwatch_metric_alarm" "s3_4xx" {
  alarm_name          = "s3-4xx-errors-alarm"
  alarm_description   = "4xxErrors > 1"
  namespace           = "AWS/S3"
  metric_name         = "4xxErrors"
  dimensions = {
    BucketName = aws_s3_bucket.main.bucket
    FilterId   = "EntireBucket"
  }
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 1
  period              = 300
  evaluation_periods  = 1
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

# S3 5xx errors alarm
resource "aws_cloudwatch_metric_alarm" "s3_5xx" {
  alarm_name          = "s3-5xx-errors-alarm"
  alarm_description   = "5xxErrors > 5"
  namespace           = "AWS/S3"
  metric_name         = "5xxErrors"
  dimensions = {
    BucketName = aws_s3_bucket.main.bucket
    FilterId   = "EntireBucket"
  }
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 5
  period              = 300
  evaluation_periods  = 1
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

# Composite alarm: OldestMsg OR Lambda Throttle
resource "aws_cloudwatch_composite_alarm" "composite" {
  alarm_name  = "composite-message-lambda-alarm"
  alarm_rule  = "ALARM(${aws_cloudwatch_metric_alarm.sqs_oldest.alarm_name}) OR ALARM(${aws_cloudwatch_metric_alarm.producer_duration.alarm_name})"
  alarm_actions = [aws_sns_topic.alerts.arn]
}
