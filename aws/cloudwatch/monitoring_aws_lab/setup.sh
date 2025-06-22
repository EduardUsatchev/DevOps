#!/usr/bin/env bash
set -e

CONTAINER_NAME=localstack
IMAGE=localstack/localstack:latest

# Remove any old container
if docker ps -aq --filter "name=${CONTAINER_NAME}" | grep -q .; then
  docker rm -f ${CONTAINER_NAME}
fi

# Start LocalStack with Docker socket
docker run -d \
  --name ${CONTAINER_NAME} \
  -p 4566:4566 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ${IMAGE}

# Correct health check
echo "⏳ Waiting for LocalStack to be healthy…"
until curl -s http://localhost:4566/_localstack/health | grep -q '"services"'; do
  sleep 5
done
echo "✅ LocalStack is healthy!"

# Package Lambdas
echo "📦 Packaging Lambdas..."
zip -j lambda_producer.zip lambda_producer.py
zip -j lambda_consumer.zip lambda_consumer.py

# Terraform init & apply
echo "🌱 Initializing Terraform…"
terraform init -upgrade

echo "✅ Applying Terraform…"
terraform apply -auto-approve

echo "🎉 Lab setup complete!"
