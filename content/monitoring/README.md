# 📊 Minikube Monitoring Project

This project demonstrates how to build and deploy a **monitored microservice** on a local **Minikube** cluster using **Prometheus** and **Kubernetes ServiceMonitors**.  
It’s designed as a practical DevOps lab for understanding how to expose custom application metrics, configure alerting rules, and visualize service health locally.

---

## 📁 Directory Overview

| File | Description |
|------|--------------|
| **Dockerfile** | Builds the Python application image that exposes Prometheus metrics. |
| **app.py** | Flask-based web app that includes `/metrics` endpoint for Prometheus scraping. |
| **deployment.yaml** | Kubernetes Deployment manifest for deploying the monitored app. |
| **service.yaml** | Exposes the app internally for Prometheus to scrape. |
| **service-monitor.yaml** | Custom **ServiceMonitor** resource used by the Prometheus Operator to collect metrics. |
| **alert-rules.yaml** | Defines alerting rules for Prometheus to trigger alerts on abnormal behavior. |
| **cmd.sh** | Utility script to build the Docker image, deploy the stack, and verify monitoring setup. |

---

## 🧠 Learning Objectives

- Deploy a **Flask application** in Kubernetes using Minikube.  
- Expose custom application metrics in **Prometheus format**.  
- Configure a **ServiceMonitor** to automatically discover services.  
- Define **Prometheus alerting rules** to detect unhealthy or high-latency states.  
- Understand the interaction between **app → metrics → Prometheus → alerting**.  

---

## ⚙️ Step-by-Step Guide

### 🧱 1. Start Minikube
```bash
minikube start --memory=4096 --cpus=2
cd minikube_monitoring_project
# Build the Docker image locally
eval $(minikube docker-env)
docker build -t monitoring-app:latest .

# Apply all Kubernetes manifests
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install kube-prometheus prometheus-community/kube-prometheus-stack -n monitoring
kubectl apply -f service-monitor.yaml -n monitoring
kubectl apply -f alert-rules.yaml -n monitoring
minikube service kube-prometheus-prometheus -n monitoring

🧩 Components Overview
Component	Role
Flask App (app.py)	Generates HTTP metrics such as request count and latency.
Prometheus Operator	Watches for ServiceMonitor and PrometheusRule resources.
ServiceMonitor	Defines how Prometheus should scrape your app metrics.
Alert Rules	Define thresholds for alerts (e.g., high response time, error rate).
🧰 Example Alert (from alert-rules.yaml)
groups:
  - name: app-alerts
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status="500"}[5m]) > 0
        for: 1m
        labels:
          severity: warning
        annotations:
          summary: "App is returning errors"
          description: "The application has returned HTTP 500 responses in the past 5 minutes."


🧠 Concept:
This rule triggers when the app generates errors for over 1 minute, alerting operators to potential backend failures.

📦 cmd.sh Overview

This helper script simplifies deployment:

#!/usr/bin/env bash
# cmd.sh
eval $(minikube docker-env)
docker build -t monitoring-app:latest .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f service-monitor.yaml
kubectl apply -f alert-rules.yaml
kubectl get pods,svc


Run it all with:

bash cmd.sh

📈 Validation

To validate that monitoring works:

Open Prometheus → Status > Targets

Check your monitoring-app endpoint is UP

Open Graph and query:

http_requests_total


Optionally, send test requests:

kubectl port-forward svc/monitoring-app 8080:80
curl http://localhost:8080/
curl http://localhost:8080/metrics
```