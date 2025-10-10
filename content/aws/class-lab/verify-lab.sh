#!/bin/bash

set -e  # Exit immediately if a command fails

echo "🚀 Verifying End-to-End DevOps Lab Setup..."

# Step 1: Check if LocalStack is running
echo "🟢 Checking LocalStack status..."
if ! docker ps | grep -q localstack; then
    echo "❌ LocalStack is not running!"
    exit 1
fi
echo "✅ LocalStack is running."

# Step 2: Verify K3s is running
echo "🟢 Checking K3s status..."
if ! multipass exec k3s -- sudo systemctl is-active --quiet k3s; then
    echo "❌ K3s is not running!"
    exit 1
fi
echo "✅ K3s is running."

# Step 3: Verify Kubernetes nodes
echo "🟢 Checking Kubernetes nodes..."
kubectl get nodes || { echo "❌ Kubernetes nodes are not available!"; exit 1; }
echo "✅ Kubernetes is healthy."

# Step 4: Check Secrets Manager secret
echo "🟢 Verifying AWS Secrets Manager secret..."
SECRET_EXISTS=$(aws --endpoint-url=http://localhost:4566 secretsmanager list-secrets | grep MyDatabaseSecret || echo "NO_SECRET")
if [[ "$SECRET_EXISTS" == "NO_SECRET" ]]; then
    echo "❌ Secret 'MyDatabaseSecret' not found!"
    exit 1
fi
echo "✅ Secrets Manager secret exists."

# Step 5: Check AWS Lambda Function
echo "🟢 Verifying AWS Lambda function..."
if ! aws --endpoint-url=http://localhost:4566 lambda list-functions | grep -q "MyLambdaFunction"; then
    echo "❌ Lambda function 'MyLambdaFunction' is missing!"
    exit 1
fi
echo "✅ AWS Lambda function exists."

# Step 6: Check SQS Queue
echo "🟢 Checking SQS queue..."
QUEUE_URL=$(aws --endpoint-url=http://localhost:4566 sqs get-queue-url --queue-name MyQueue 2>/dev/null | jq -r '.QueueUrl' || echo "")
if [[ -z "$QUEUE_URL" ]]; then
    echo "❌ SQS Queue 'MyQueue' not found!"
    exit 1
fi
echo "✅ SQS Queue is available."

# Step 7: Send and Receive Message from SQS
echo "🟢 Sending test message to SQS..."
aws --endpoint-url=http://localhost:4566 sqs send-message --queue-url $QUEUE_URL --message-body "Test Message"

sleep 5  # Wait for the message to process

echo "🟢 Receiving message from SQS..."
RECEIVED_MSG=$(aws --endpoint-url=http://localhost:4566 sqs receive-message --queue-url $QUEUE_URL --wait-time-seconds 10 --visibility-timeout 30 2>/dev/null | jq -r '.Messages[0].Body' || echo "")
if [[ "$RECEIVED_MSG" == "Test Message" ]]; then
    echo "✅ SQS is functioning correctly."
else
    echo "❌ Failed to receive SQS message."
    echo "🔍 Possible Issues:"
    echo "   - Lambda might be consuming the message before the script."
    echo "   - Message retention policy might be too short."
    echo "   - Message visibility timeout might be causing early deletion."
    exit 1
fi

# Step 8: Invoke Lambda Function and Verify Output
echo "🟢 Invoking AWS Lambda function..."
aws --endpoint-url=http://localhost:4566 lambda invoke --function-name MyLambdaFunction response.json
cat response.json
if grep -q "Retrieved secret" response.json; then
    echo "✅ Lambda function executed successfully."
else
    echo "❌ Lambda function execution failed!"
    exit 1
fi

# Step 9: Verify Kubernetes Deployment
echo "🟢 Checking Kubernetes Lambda deployment..."
if ! kubectl get deployments | grep -q "lambda-deployment"; then
    echo "❌ Kubernetes Lambda deployment is missing!"
    exit 1
fi
echo "✅ Kubernetes Lambda deployment is running."

echo "🎉✅ All resources are running and communicating successfully!"
