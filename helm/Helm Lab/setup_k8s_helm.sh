#!/bin/bash

set -e
set -o pipefail

echo "🚀 Setting up Kubernetes & Helm Deployment..."

for tool in brew docker kind helm kubectl; do
  if ! command -v $tool &>/dev/null; then
    echo "🔧 Installing $tool..."
    brew install $tool
  else
    echo "✅ $tool is already installed"
  fi
done

if ! docker ps | grep -q registry; then
  echo "📦 Starting local Docker registry..."
  docker run -d -p 5001:5000 --name registry registry:2
else
  echo "✅ Local Docker registry is already running"
fi

echo "🐳 Building and pushing Docker image..."
docker build -t localhost:5001/myapp:1.0.0 .
docker push localhost:5001/myapp:1.0.0

if ! kind get clusters | grep -q dev-cluster; then
  echo "📦 Creating Kubernetes cluster..."
  kind create cluster --name dev-cluster
fi

if ! docker ps | grep -q chartmuseum; then
  echo "📦 Deploying ChartMuseum..."

  CHARTS_DIR="$(pwd)/charts"
  mkdir -p "$CHARTS_DIR"  # Ensure the directory exists

  docker run -d \
    -p 8080:8080 \
    -v "$CHARTS_DIR:/charts" \
    -e STORAGE="local" \
    -e STORAGE_LOCAL_ROOTDIR="/charts" \
    --name chartmuseum \
    ghcr.io/helm/chartmuseum:v0.14.0
fi


echo "📦 Packaging Helm chart..."
helm package myapp-chart
curl --data-binary "@myapp-1.0.0.tgz" http://localhost:8080/api/charts

helm repo add myrepo http://localhost:8080
helm repo update
helm install myapp myrepo/myapp --version 1.0.0

echo "✅ Deployment complete! Access app at http://localhost:30080"
