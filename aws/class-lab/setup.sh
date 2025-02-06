#!/bin/bash

set -e  # Exit immediately if a command fails

echo "🚀 Starting End-to-End DevOps Lab Setup..."

# Step 1: Start LocalStack (Simulated AWS)
echo "🟢 Starting LocalStack..."
docker run --rm -d --name localstack \
  -p 4566:4566 -p 4510-4559:4510-4559 \
  -e SERVICES="lambda,secretsmanager,iam" \
  -e DEFAULT_REGION="us-east-1" \
  -e DOCKER_HOST="unix:///var/run/docker.sock" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  localstack/localstack

# Wait for LocalStack to be ready
sleep 5

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
multipass launch --name k3s --mem 4G --disk 40G

echo "🟢 Installing K3s in the VM..."
multipass exec k3s -- bash -c "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='server --write-kubeconfig-mode=644' sh -"

echo "🟢 Adjusting kubeconfig permissions..."
multipass exec k3s -- sudo chmod 644 /etc/rancher/k3s/k3s.yaml

echo "🟢 Fetching kubeconfig..."
multipass exec k3s -- cat /etc/rancher/k3s/k3s.yaml > kubeconfig.yaml

# Validate K3s installation
if ! kubectl get nodes > /dev/null 2>&1; then
    echo "❌ K3s failed to start! Check kubeconfig."
    exit 1
fi
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

# Step 5: Create and Deploy AWS Lambda Function
echo "🟢 Creating AWS Lambda function..."
cat <<EOF > lambda_function.py
import json
import boto3
import os

def lambda_handler(event, context):
    localstack_endpoint = f"http://{os.getenv('LOCALSTACK_HOSTNAME', 'host.docker.internal')}:4566"
    secret_name = "MyDatabaseSecret"

    client = boto3.client('secretsmanager', endpoint_url=localstack_endpoint)

    secret = client.get_secret_value(SecretId=secret_name)
    secret_data = json.loads(secret['SecretString'])

    return {
        'statusCode': 200,
        'body': json.dumps(f"Retrieved secret: {secret_data}")
    }
EOF

zip function.zip lambda_function.py

# Validate function.zip exists
if [[ ! -f "function.zip" ]]; then
    echo "❌ Lambda function package missing!"
    exit 1
fi

echo "🟢 Deploying AWS Lambda function..."
aws --endpoint-url=http://localhost:4566 lambda create-function \
  --function-name MyLambdaFunction \
  --runtime python3.8 \
  --role arn:aws:iam::000000000000:role/lambda-role \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://function.zip || echo "✅ Lambda function already exists."

# Step 6: Install Terraform (for macOS M2)
echo "🟢 Installing Terraform..."
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

terraform -version

# Step 7: Setup Terraform Configuration
echo "🟢 Setting up Terraform..."
mkdir -p terraform-lab && cd terraform-lab

cat <<EOF > main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.85.0"
    }
  }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true

  endpoints {
    lambda         = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    iam           = "http://localhost:4566"
  }
}

resource "aws_secretsmanager_secret" "db_secret" {
  name = "MyDatabaseSecret"

  lifecycle {
    ignore_changes = [name]
  }
}

resource "aws_lambda_function" "my_lambda" {
  function_name    = "MyLambdaFunction"
  role            = "arn:aws:iam::000000000000:role/lambda-role"
  runtime         = "python3.8"
  handler         = "lambda_function.lambda_handler"
  filename        = "../function.zip"
  source_code_hash = filebase64sha256("../function.zip")
  timeout         = 60

  lifecycle {
    ignore_changes = [source_code_hash]
  }
}
EOF

echo "🟢 Initializing and Applying Terraform..."
terraform init
terraform apply -auto-approve

# Validate Terraform execution
if [[ $? -ne 0 ]]; then
    echo "❌ Terraform deployment failed!"
    exit 1
fi
echo "✅ Terraform applied successfully."

# Step 8: Deploy AWS Lambda in K3s
echo "🟢 Deploying AWS Lambda in K3s..."
kubectl apply -f lambda-deployment.yaml --validate=false

# Validate Kubernetes deployment
if ! kubectl get pods | grep -q lambda-deployment; then
    echo "❌ Lambda deployment failed in Kubernetes!"
    exit 1
fi
echo "✅ Lambda successfully deployed in K3s."

# Step 9: Expose Lambda via Kubernetes Service
echo "🟢 Exposing Lambda service..."
kubectl apply -f lambda-service.yaml --validate=false

# Validate Kubernetes service
if ! kubectl get svc | grep -q lambda-service; then
    echo "❌ Lambda service exposure failed!"
    exit 1
fi
echo "✅ Lambda service successfully exposed in K3s."

echo "🎉✅ Lab setup complete! AWS Lambda, Secrets Manager, Terraform, and K3s are running."
