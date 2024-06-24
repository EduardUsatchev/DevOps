#!/bin/bash
eval $(minikube docker-env)

# To point your shell to minikube's docker-daemon, run:
eval $(minikube -p minikube docker-env)

# Docker build and push
docker build -t flask-app:latest .
docker tag flask-app:latest $(minikube ip):5000/flask-app:latest
minikube image load flask-app:latest

#docker push your-username/flask-app:latest

# Apply Kubernetes manifests
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

kubectl port-forward flask-app-deployment-65d7448d59-5kxsd 5000:5000 -n flask

