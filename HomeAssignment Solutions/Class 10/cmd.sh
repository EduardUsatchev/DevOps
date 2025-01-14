
#!/bin/bash

# Start Minikube
echo "Starting Minikube..."
minikube start --cpus=4 --memory=8192

# Build and deploy Python app
echo "Building Python app Docker image..."
eval $(minikube docker-env)
docker build -t python-app:latest .

echo "Deploying Python app..."
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Add Prometheus Helm chart repository and install stack
echo "Adding Prometheus Helm chart repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "Installing Prometheus stack..."
helm install prometheus-stack prometheus-community/kube-prometheus-stack

# Apply ServiceMonitor and alert rules
echo "Applying ServiceMonitor and alert rules..."
kubectl apply -f service-monitor.yaml
kubectl apply -f alert-rules.yaml

# Install ArgoCD
echo "Installing ArgoCD..."
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Setup complete. Use kubectl port-forward to access Prometheus, Grafana, and ArgoCD."
