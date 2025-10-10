# ☸️ Kubernetes Labs and Examples

This directory contains **hands-on Kubernetes exercises and manifests** demonstrating how to deploy, scale, monitor, and manage containerized workloads.

It is part of the DevOps learning series designed to teach practical Kubernetes concepts — from simple pods and health probes to multi-service deployments and scheduled jobs.

---

## 📁 Directory Overview

| Folder / File | Description |
|----------------|-------------|
| **cronjobs/** | Demonstrates how to schedule recurring tasks in Kubernetes using `CronJob` resources. |
| **daemonSet/** | Shows how to run pods on **every node** in a cluster via DaemonSets (e.g., logging agents, monitoring sidecars). |
| **deploy_flask/** | A full deployment of a Flask web app with a `Deployment`, `Service`, and `Namespace` — including Docker and Helm-ready assets. |
| **liveness-probe/** | Demonstrates how to configure **liveness probes** to automatically restart failing pods. |
| **rediness-probe/** | Demonstrates **readiness probes** that ensure pods receive traffic only when they’re ready. |
| **livness-rediness-combined/** | Combines both probes to show how Kubernetes manages availability and reliability together. |
| **superset-airflow-db/** | A complete multi-service example integrating **Apache Superset**, **Airflow**, and **PostgreSQL** — showing advanced configuration and dependency management. |

---

## 🧠 Key Learning Objectives

- Deploy applications declaratively using **YAML manifests**.  
- Understand how Kubernetes schedules and manages workloads.  
- Learn the difference between **Deployments**, **DaemonSets**, and **CronJobs**.  
- Configure **probes** for application self-healing and traffic control.  
- Deploy and connect multiple microservices (Superset, Airflow, Postgres).  
- Explore **namespace**, **service**, and **configmap** definitions in real-world apps.

---

## 🧩 Detailed Module Structure

### 🕓 1. CronJobs (`cronjobs/`)
| File | Description |
|------|--------------|
| **cronjob.yaml** | Example of a recurring job that runs commands or scripts on a schedule (e.g., backups, cleanup, reports). |

🧠 *Concept:* Kubernetes `CronJob` = Linux cron + pod orchestration. Demonstrates `spec.schedule`, `concurrencyPolicy`, and job retention.

---

### ⚙️ 2. DaemonSets (`daemonSet/`)
| File | Description |
|------|--------------|
| **nginx-daemonset.yaml** | Deploys an NGINX container on **every cluster node**. |
| **kind-two-node-cluster.yaml** | Kind configuration for creating a local multi-node cluster to test DaemonSets. |
| **daemonset-demo.sh** | Script to deploy and validate DaemonSet behavior across nodes. |

🧠 *Concept:* DaemonSets ensure critical infrastructure pods (e.g., log collectors or monitoring agents) run cluster-wide.

---

### 🐍 3. Flask Deployment (`deploy_flask/`)
| File | Description |
|------|--------------|
| **Dockerfile** | Builds a containerized Flask application. |
| **app.py** | Example Python web app with a `/` route. |
| **deployment.yaml** | Defines a Kubernetes Deployment for running the Flask app. |
| **service.yaml** | Exposes the Flask app as a ClusterIP or LoadBalancer service. |
| **namespace.yaml** | Creates a logical isolation layer for the application. |
| **deploy.sh** | Script to build, push, and deploy the Flask app. |
| **requirements.txt** | Python dependencies for the app. |

🧠 *Concept:* Demonstrates app containerization, deployment, and service exposure in Kubernetes.

---

### ❤️ 4. Health Probes

| Folder | Description |
|---------|-------------|
| **liveness-probe/** | Uses `livenessProbe` to detect and restart hung or unresponsive containers. |
| **rediness-probe/** | Uses `readinessProbe` to delay service traffic until the pod is ready. |
| **livness-rediness-combined/** | Combines both for robust health management, showing how Kubernetes differentiates *alive* vs *ready*. |

🧠 *Concept:* Probes make applications **self-healing** and **traffic-safe** — critical for production-grade workloads.

---

### 🧱 5. Superset + Airflow + Postgres (`superset-airflow-db/`)
| File | Description |
|------|--------------|
| **superset-deployment.yaml / superset-configmap.yaml** | Deploys Apache Superset and configures environment variables. |
| **superset-postgres.yaml / superset-pvc.yaml** | Persistent Postgres database backend for Superset. |
| **airflow-deployment.yaml / airflow-postgres.yaml** | Deploys Apache Airflow with a dedicated Postgres instance. |

🧠 *Concept:* Demonstrates a **multi-tier application** using shared configuration and persistent storage — a realistic enterprise setup.

---

## ⚙️ Quick Start

```bash
# 1. Create a Kind or Minikube cluster
kind create cluster --config daemonSet/kind-two-node-cluster.yaml

# 2. Deploy a simple Flask app
cd deploy_flask
bash deploy.sh

# 3. Verify deployments and services
kubectl get pods,svc -n flask-app

# 4. Test liveness & readiness probes
kubectl describe pod <flask-pod-name>

# 5. Apply a DaemonSet or CronJob
kubectl apply -f daemonSet/nginx-daemonset.yaml
kubectl apply -f cronjobs/cronjob.yaml
