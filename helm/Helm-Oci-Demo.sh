#!/bin/bash

# Exit on error
set -e

# Variables
REGISTRY="<your-registry>"  # Replace with your OCI registry URL (e.g., Docker Hub, AWS ECR)
IMAGE_NAME="your-app"
IMAGE_TAG="1.0"
HELM_CHART_NAME="your-app-chart"
CHART_VERSION="0.1.0"

# Step 1: Build and Push Docker Image
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

echo "Tagging Docker image..."
docker tag $IMAGE_NAME:$IMAGE_TAG $REGISTRY/$IMAGE_NAME:$IMAGE_TAG

echo "Pushing Docker image to OCI registry..."
docker push $REGISTRY/$IMAGE_NAME:$IMAGE_TAG

# Step 2: Create Helm Chart
echo "Creating Helm chart..."
helm create $HELM_CHART_NAME

# Update values.yaml with the Docker image details
echo "Updating values.yaml..."
cat <<EOF > $HELM_CHART_NAME/values.yaml
image:
  repository: $REGISTRY/$IMAGE_NAME
  tag: "$IMAGE_TAG"
  pullPolicy: IfNotPresent
EOF

# Step 3: Package and Push Helm Chart to OCI Registry
echo "Packaging Helm chart..."
helm package $HELM_CHART_NAME

# Enable Helm OCI experimental feature
export HELM_EXPERIMENTAL_OCI=1

echo "Pushing Helm chart to OCI registry..."
helm push $HELM_CHART_NAME-$CHART_VERSION.tgz oci://$REGISTRY/helm-charts

# Step 4: Deploy Helm Chart
echo "Logging in to OCI registry..."
helm registry login $REGISTRY

echo "Installing Helm chart..."
helm install $IMAGE_NAME oci://$REGISTRY/helm-charts/$HELM_CHART_NAME --version $CHART_VERSION

# Step 5: Verify Deployment
echo "Verifying deployment..."
kubectl get pods

# Done
echo "Deployment completed successfully!"
