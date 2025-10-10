#!/usr/bin/env python3
import os
import zipfile

def create_lab_package():
    lab_dir = 'monitoring_aws_lab'
    os.makedirs(lab_dir, exist_ok=True)

    files = {
        'provider.tf': """terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  access_key                  = "test"
  secret_key                  = "test"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    lambda     = "http://localhost:4566"
    sqs        = "http://localhost:4566"
    s3         = "http://localhost:4566"
    sns        = "http://localhost:4566"
    cloudwatch = "http://localhost:4566"
    logs       = "http://localhost:4566"
  }
}
""",
        'variables.tf': """variable "aws_region" {
  type    = string
  default = "us-east-1"
}
""",
        'iam.tf': """# IAM role for both Lambdas
resource "aws_iam_role" "lambda_exec" {
  name = "lab_lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
""",
        'sns.tf': """resource "aws_sns_topic" "alerts" {
  name = "lab-alerts-topic"
}
""",
        'sqs.tf': """resource "aws_sqs_queue" "queue" {
  name = "lab-sqs-queue"
}
""",
        'lambda.tf': """# Producer Lambda (triggered by S3, logs & pushes to SQS)
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
""",
        's3.tf': """resource "aws_s3_bucket" "main" {
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
""",
        's3_logging.tf': """# Bucket for access logs
resource "aws_s3_bucket" "access_logs" {
  bucket = "lab-s3-access-logs"
}

# Enable server access logging
resource "aws_s3_bucket_logging" "main_logs" {
  bucket = aws_s3_bucket.main.id
  target_bucket = aws_s3_bucket.access_logs.id
  target_prefix = "logs/"
}
""",
        'cloudwatch_alarms.tf': """# Error alarm for Producer Lambda
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
""",
        'cloudwatch_dashboard.tf': """resource "aws_cloudwatch_dashboard" "lab_dashboard" {
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
""",
        'lambda_producer.py': """import json
import time
import random
import boto3
import os

# SQS client pointing at LocalStack
sqs = boto3.client(
    'sqs',
    endpoint_url=os.getenv('AWS_ENDPOINT_URL', 'http://localhost:4566')
)
QUEUE_URL = os.getenv('QUEUE_URL', 'http://localhost:4566/000000000000/lab-sqs-queue')

def handler(event, context):
    # Structured log of incoming event
    log = {"timestamp": int(time.time()), "event": event}
    print(json.dumps(log))

    # Randomly throw an error for alarm testing
    if random.choice([True, False]):
        raise Exception("Intentional error for CloudWatch alarm")

    # Simulate work
    start = time.time()
    time.sleep(random.uniform(0.5, 1.5))
    duration_ms = (time.time() - start) * 1000
    print(json.dumps({"duration_ms": duration_ms}))

    # Push to SQS
    sqs.send_message(QueueUrl=QUEUE_URL, MessageBody=json.dumps({
        "event": event,
        "duration_ms": duration_ms
    }))

    return {"status": "ok"}
""",
        'lambda_consumer.py': """import json

def handler(event, context):
    for record in event.get('Records', []):
        print(f"Consumed SQS message: {record['body']}")
    return {"status": "processed"}
""",
        'setup.sh': """#!/usr/bin/env bash
set -e

echo "🔧 Starting LocalStack..."
docker run --rm -d --name localstack -p 4566:4566 localstack/localstack
sleep 10

echo "📦 Packaging Lambdas..."
zip -j lambda_producer.zip lambda_producer.py
zip -j lambda_consumer.zip lambda_consumer.py

echo "🌱 Initializing Terraform..."
terraform init

echo "✅ Applying Terraform..."
terraform apply -auto-approve

echo "🎉 Lab setup complete!"
""",
        'verify-lab.sh': """#!/usr/bin/env bash
set -e

AWS="aws --endpoint-url=http://localhost:4566"

echo "🔍 Checking SQS queue..."
$AWS sqs get-queue-url --queue-name lab-sqs-queue

echo "🚀 Invoking producer Lambda..."
echo '{}' > /tmp/event.json
$AWS lambda invoke \
  --function-name lab_lambda_producer \
  --payload file:///tmp/event.json \
  /tmp/output.txt
cat /tmp/output.txt

echo "✉️ Sending test message to SQS..."
QURL=$($AWS sqs get-queue-url --queue-name lab-sqs-queue --query 'QueueUrl' --output text)
$AWS sqs send-message --queue-url $QURL --message-body '{"test":"hello"}'

echo "📈 Fetching SQS metrics..."
$AWS cloudwatch get-metric-statistics \
  --namespace AWS/SQS \
  --metric-name ApproximateNumberOfMessagesVisible \
  --dimensions Name=QueueName,Value=lab-sqs-queue \
  --start-time $(date -u -d '-5 minutes' '+%Y-%m-%dT%H:%M:00Z') \
  --end-time   $(date -u '+%Y-%m-%dT%H:%M:00Z') \
  --period 60 --statistics Average

echo "📊 Describing CloudWatch Dashboard..."
$AWS cloudwatch describe-dashboards --dashboard-names Lab-Monitoring-Dashboard

echo "✅ Verification complete!"
"""
    }

    # Write files
    for fname, content in files.items():
        with open(os.path.join(lab_dir, fname), 'w') as f:
            f.write(content)

    # Create zip
    zip_path = 'monitoring_aws_lab.zip'
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for fname in files:
            zipf.write(os.path.join(lab_dir, fname), arcname=fname)

    print("Created monitoring_aws_lab.zip containing all lab files.")

if __name__ == '__main__':
    create_lab_package()
