#!/bin/bash

# Set AWS CLI to use LocalStack
export AWS_ENDPOINT_URL="http://localhost:4566"

# Function to check if LocalStack is running
check_localstack() {
    if docker ps | grep -q localstack; then
        echo "✅ LocalStack is already running."
    else
        echo "🔄 Starting LocalStack..."
        docker start localstack 2>/dev/null || docker run -d --name localstack -p 4566:4566 localstack/localstack
        echo "⏳ Waiting for LocalStack to be ready..."
        sleep 5
    fi
}

# Check if environment argument is provided
ENVIRONMENT=$1
if [ -z "$ENVIRONMENT" ]; then
    echo "❌ Error: Please provide an environment (dev/prod)"
    exit 1
fi

# Check and start LocalStack if needed
check_localstack

# Deploy Terraform
echo "🚀 Deploying Terraform for environment: $ENVIRONMENT"
cd terraform
terraform init
terraform apply -var-file="envs/${ENVIRONMENT}.tfvars" -auto-approve

# Get EC2 Instance Details
echo "🔍 Fetching EC2 Instance Details..."
INSTANCE_ID=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text --endpoint-url=$AWS_ENDPOINT_URL)
INSTANCE_IP=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text --endpoint-url=$AWS_ENDPOINT_URL)

echo "✅ EC2 Instance Created: ID=$INSTANCE_ID, IP=$INSTANCE_IP"

# Simulate EC2 Instance using Docker (if not running)
if ! docker ps | grep -q "ec2-$ENVIRONMENT"; then
    echo "🛠️ Simulating EC2 instance using Docker..."
    docker run -d --name ec2-$ENVIRONMENT --hostname ec2-$ENVIRONMENT alpine sleep infinity
else
    echo "✅ EC2 Simulation already running for $ENVIRONMENT."
fi

# Verify EC2 "access"
echo "🔗 To access the simulated EC2 instance, run:"
echo "    docker exec -it ec2-$ENVIRONMENT sh"

# Output details
echo "✅ Deployment Complete for $ENVIRONMENT Environment!"
