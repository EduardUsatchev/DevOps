#!/usr/bin/env bash
################################################################################
# setup_localstack_sqs_lambda.sh
#
# Purpose:
#  - Start LocalStack with Docker-based Lambda execution (mount Docker socket).
#  - Create a local Terraform project that deploys:
#    * An SQS queue (myMainQueue).
#    * A Dead-Letter Queue (myDLQ).
#    * A Lambda function (SQSConsumerLambda) that processes messages from myMainQueue.
#    * An event source mapping (SQS -> Lambda).
#  - Send test messages (normal and "error") to show how it handles them.
#
# This setup requires:
#  - Docker (running, with /var/run/docker.sock).
#  - Terraform installed.
#  - AWS CLI to test and send messages.
#
# Usage:
#   chmod +x setup_localstack_sqs_lambda.sh
#   ./setup_localstack_sqs_lambda.sh
################################################################################

set -e  # Exit on any error

CONTAINER_NAME="localstack_dev"

echo "1) Stopping and removing any existing LocalStack container (${CONTAINER_NAME})..."
docker stop "${CONTAINER_NAME}" >/dev/null 2>&1 || true
docker rm   "${CONTAINER_NAME}" >/dev/null 2>&1 || true

echo "2) Starting LocalStack with Docker-based Lambda execution..."
docker run -d \
  --name "${CONTAINER_NAME}" \
  -p 4566:4566 \
  -p 4571:4571 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e DOCKER_HOST="unix:///var/run/docker.sock" \
  -e SERVICES="sqs,lambda,iam,sts" \
  localstack/localstack

echo "   Waiting 5 seconds for LocalStack to come up..."
sleep 5

# 3) Configure AWS CLI to point to LocalStack
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"

WORKING_DIR="localstack-lab"
echo "4) Removing any old '${WORKING_DIR}' directory..."
rm -rf "${WORKING_DIR}" || true
mkdir -p "${WORKING_DIR}"
cd "${WORKING_DIR}"

echo "5) Creating Lambda code (app.py)..."
cat << 'EOF' > app.py
import json

def lambda_handler(event, context):
    for record in event.get('Records', []):
        body = record['body']
        print(f"[Lambda] Received message: {body}")

        # Force an error if the message contains "error" to demonstrate DLQ usage
        if "error" in body.lower():
            raise ValueError("Forcing an error to test DLQ behavior!")

    return {
        "statusCode": 200,
        "body": json.dumps("Messages processed successfully")
    }
EOF

echo "6) Zipping Lambda code..."
zip lambda_package.zip app.py > /dev/null

echo "7) Creating main.tf (Terraform config)..."
cat << 'EOF' > main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    sqs    = "http://localhost:4566"
    lambda = "http://localhost:4566"
    iam    = "http://localhost:4566"
    sts    = "http://localhost:4566"
  }
}

# Dead-Letter Queue
resource "aws_sqs_queue" "dlq" {
  name = "myDLQ"
}

# Main SQS Queue with redrive to DLQ
resource "aws_sqs_queue" "main_queue" {
  name = "myMainQueue"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 5
  })
}

# IAM Role and Policy for Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name               = "lambda_exec_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "lambda_exec_policy" {
  name = "lambda_exec_policy"
  role = aws_iam_role.lambda_exec_role.id

  policy = data.aws_iam_policy_document.lambda_inline_policy.json
}

data "aws_iam_policy_document" "lambda_inline_policy" {
  statement {
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueUrl",
      "sqs:GetQueueAttributes",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }
}

# Lambda Function
resource "aws_lambda_function" "sqs_consumer_lambda" {
  function_name = "SQSConsumerLambda"
  runtime       = "python3.9"
  handler       = "app.lambda_handler"
  role          = aws_iam_role.lambda_exec_role.arn

  filename         = "lambda_package.zip"
  source_code_hash = filebase64sha256("lambda_package.zip")
}

# SQS -> Lambda event source mapping
resource "aws_lambda_event_source_mapping" "sqs_to_lambda" {
  event_source_arn = aws_sqs_queue.main_queue.arn
  function_name    = aws_lambda_function.sqs_consumer_lambda.arn
  batch_size       = 5
  enabled          = true
}
EOF

echo "8) Initializing Terraform..."
terraform init

echo "9) Applying Terraform configuration..."
terraform apply -auto-approve

echo
echo "Terraform apply complete."

# 10) Send test messages
MAIN_QUEUE_URL="http://localhost:4566/000000000000/myMainQueue"

echo "Sending normal message to 'myMainQueue'..."
aws --endpoint-url=http://localhost:4566 sqs send-message \
  --queue-url "${MAIN_QUEUE_URL}" \
  --message-body "Hello from Docker-based Lambda executor!"

echo "Sending error message to 'myMainQueue' (should eventually go to DLQ)..."
aws --endpoint-url=http://localhost:4566 sqs send-message \
  --queue-url "${MAIN_QUEUE_URL}" \
  --message-body "This message triggers an ERROR"

cat <<EOT

================================================================================
SETUP COMPLETE!

LocalStack is running with Docker-based Lambda execution.

Resources:
 - SQS Queues: myMainQueue, myDLQ
 - Lambda Function: SQSConsumerLambda
 - Event Source Mapping: SQS -> Lambda

Check your resources with:
  aws --endpoint-url=http://localhost:4566 sqs list-queues
  aws --endpoint-url=http://localhost:4566 lambda list-functions

Check logs in the localstack_dev container:
  docker logs localstack_dev

When done, you can remove the environment by:
  docker stop localstack_dev && docker rm localstack_dev
  cd localstack-lab && terraform destroy -auto-approve

================================================================================
EOT
