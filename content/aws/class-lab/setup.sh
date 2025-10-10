#!/bin/bash

set -e  # Exit immediately if a command fails

echo "🚀 Starting End-to-End DevOps Lab Setup..."

# Step 1: Start LocalStack (Simulated AWS)
echo "🟢 Starting LocalStack..."

# Check if LocalStack is already running
if docker ps --format '{{.Names}}' | grep -q "^localstack$"; then
    echo "✅ LocalStack is already running. Skipping startup."
else
    docker run --rm -d --name localstack \
      -p 4566:4566 -p 4510-4559:4510-4559 \
      -e SERVICES="lambda,secretsmanager,iam,sqs" \
      -e DEFAULT_REGION="us-east-1" \
      -e DOCKER_HOST="unix:///var/run/docker.sock" \
      -v /var/run/docker.sock:/var/run/docker.sock \
      localstack/localstack
    sleep 5  # Wait for LocalStack to be ready
fi

# Validate LocalStack is running
if ! docker ps | grep -q localstack; then
    echo "❌ LocalStack failed to start!"
    exit 1
fi
echo "✅ LocalStack is running."

# Step 2: Install and Set Up K3s on Mac M1 using Multipass
echo "🟢 Installing K3s on Mac M1 using Multipass..."
brew install --cask multipass

echo "🟢 Creating Multipass VM for K3s..."
multipass launch --name k3s --memory 4G --disk 40G || echo "✅ K3s instance already exists. Skipping launch."

echo "🟢 Installing K3s in the VM..."
multipass exec k3s -- bash -c "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='server --write-kubeconfig-mode=644' sh -"

echo "🟢 Adjusting kubeconfig permissions..."
multipass exec k3s -- sudo chmod 644 /etc/rancher/k3s/k3s.yaml

echo "🟢 Fetching kubeconfig..."
multipass exec k3s -- cat /etc/rancher/k3s/k3s.yaml > kubeconfig.yaml

# Ensure correct kubeconfig IP
VM_IP=$(multipass info k3s | grep IPv4 | awk '{print $2}')
sed -i '' "s|server: https://127.0.0.1:6443|server: https://$VM_IP:6443|" kubeconfig.yaml
export KUBECONFIG=$(pwd)/kubeconfig.yaml

echo "🟢 Verifying K3s installation..."
kubectl get nodes || { echo "❌ K3s failed to start! Check logs."; exit 1; }

echo "✅ K3s is running. You can now use Kubernetes."

# Step 3: Configure AWS CLI for LocalStack
echo "🟢 Configuring AWS CLI..."
aws configure set aws_access_key_id test
aws configure set aws_secret_access_key test
aws configure set region us-east-1

echo "🟢 Checking Secrets Manager in LocalStack..."
aws --endpoint-url=http://localhost:4566 secretsmanager list-secrets

# Step 4: Create a Secret in AWS Secrets Manager
SECRET_EXISTS=$(aws --endpoint-url=http://localhost:4566 secretsmanager list-secrets | grep MyDatabaseSecret || echo "NO_SECRET")
if [[ "$SECRET_EXISTS" == "NO_SECRET" ]]; then
    echo "🟢 Creating secret in AWS Secrets Manager..."
    aws --endpoint-url=http://localhost:4566 secretsmanager create-secret \
      --name MyDatabaseSecret \
      --secret-string '{"username":"admin", "password":"SuperSecret123"}'
else
    echo "✅ Secret already exists."
fi

# Step 5: Create AWS Lambda Function
echo "🟢 Ensuring AWS Lambda function exists..."
if ! aws --endpoint-url=http://localhost:4566 lambda list-functions | grep -q "MyLambdaFunction"; then
    echo "🟢 Creating AWS Lambda function..."
    aws --endpoint-url=http://localhost:4566 lambda create-function \
      --function-name MyLambdaFunction \
      --runtime python3.8 \
      --role arn:aws:iam::000000000000:role/lambda-role \
      --handler lambda_function.lambda_handler \
      --zip-file fileb://function.zip
else
    echo "✅ Lambda function already exists."
fi

# Step 6: Wait for Lambda to be available
while ! aws --endpoint-url=http://localhost:4566 lambda get-function --function-name MyLambdaFunction >/dev/null 2>&1; do
    echo "⏳ Waiting for Lambda function to be created..."
    sleep 3
done

# Step 7: Create SQS Queue
echo "🟢 Creating SQS Queue in LocalStack..."
QUEUE_URL=$(aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name MyQueue | jq -r '.QueueUrl')

if [[ -z "$QUEUE_URL" ]]; then
    echo "❌ Failed to create SQS queue."
    exit 1
fi
echo "✅ SQS Queue created: $QUEUE_URL"

# Step 8: Update Lambda Configuration with SQS
echo "🟢 Updating AWS Lambda to process SQS messages..."
aws --endpoint-url=http://localhost:4566 lambda update-function-configuration \
  --function-name MyLambdaFunction \
  --environment "Variables={SQS_QUEUE_URL=$QUEUE_URL}"

echo "🟢 Sending test message to SQS..."
aws --endpoint-url=http://localhost:4566 sqs send-message \
  --queue-url $QUEUE_URL \
  --message-body "Hello from SQS!"

# Step 9: Validate SQS message reception
echo "🟢 Receiving message from SQS..."
sleep 5  # Give time for message processing
RECEIVED_MSG=$(aws --endpoint-url=http://localhost:4566 sqs receive-message --queue-url $QUEUE_URL --wait-time-seconds 10 --visibility-timeout 30 2>/dev/null | jq -r '.Messages[0].Body' || echo "")
if [[ "$RECEIVED_MSG" == "Hello from SQS!" ]]; then
    echo "✅ SQS message successfully sent and received."
else
    echo "❌ Failed to receive SQS message. Debugging required."
    exit 1
fi

echo "✅ Lab setup complete! AWS Lambda, SQS, Secrets Manager, Terraform, and K3s are running."
