
#!/bin/bash

# Start Minikube with sufficient resources
echo "Starting Minikube..."
minikube start --cpus=4 --memory=8192

# Create Python app deployment
echo "Creating Python app deployment..."
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Add Prometheus Helm chart repository and update
echo "Adding Prometheus Helm chart repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install Prometheus and Grafana using Helm
echo "Installing Prometheus and Grafana..."
helm install prometheus-stack prometheus-community/kube-prometheus-stack

# Apply ServiceMonitor for Python app
echo "Applying ServiceMonitor for Python app..."
kubectl apply -f service-monitor.yaml

# Apply alert rules for Python app
echo "Applying alert rules..."
kubectl apply -f alert-rules.yaml

# Display completion message
echo "Setup complete. Use kubectl port-forward to access Prometheus and Grafana."
