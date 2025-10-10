# ⚓ Helm Labs and Examples

This directory contains a **comprehensive set of Helm training materials** — from chart creation and dependency management to testing, chart repositories, plugins, and real-world use cases.  
It is designed for DevOps engineers learning how to package, test, and deploy Kubernetes applications using **Helm**.

---

## 📁 Directory Overview

| Folder / File | Description |
|----------------|--------------|
| **Chart Museum/** | Demonstrates how to create, package, and publish Helm charts to a local or remote Chart Museum repository. |
| **Helm Chart Testing and Validation/** | Contains examples of automated testing and validation for Helm charts. |
| **Helm Lab/** | A complete, hands-on Helm lab — includes a Python app, Dockerfile, setup scripts, and chart promotion examples. |
| **Helm Plugins and Extensions/** | Demonstrates installation and usage of Helm plugins that extend Helm’s core capabilities. |
| **Helm-Oci-Demo.sh** | Example script showing how to store and pull Helm charts from OCI-compliant registries (e.g., Docker Hub, GHCR, ACR). |
| **Managing Chart Dependencies/** | Demonstrates how to define and manage chart dependencies in `Chart.yaml`. |
| **Real-World Case Studies and Hands-On Labs/** | Practical, production-inspired chart examples showing multi-environment deployment and templating. |
| **Security Best Practices for Helm/** | Shows how to handle secrets securely, enforce policies, and adopt best practices for safe Helm usage. |
| **helm-repo.yaml** | Example manifest for configuring a Helm repository in CI/CD pipelines. |
| **templates/** | Shared Kubernetes manifests used across examples (e.g., `deployment.yaml`). |

---

## 🧠 Key Learning Objectives

- Create and package Helm charts (`helm create`, `helm package`).
- Host and fetch charts from a **Chart Museum** repository.
- Define and manage **chart dependencies** (`requirements.yaml`, `Chart.yaml`).
- Use **Helm values** to customize deployments across environments.
- Test Helm charts with **`helm test`** and best-practice validations.
- Integrate Helm with **OCI registries** (push/pull charts via container registries).
- Implement **security best practices** (secrets, RBAC, policies).
- Automate chart promotion and versioning in CI/CD pipelines.

---

## 🧩 Detailed Module Structure

### 🏗️ Chart Museum (`Chart Museum/`)
| File | Purpose |
|------|----------|
| **charts/index-cache.yaml** | Repository index cache used by Chart Museum. |
| **charts/mychart-0.1.0.tgz** | Pre-packaged example chart. |
| **mychart/** | Source chart containing templates for Deployment, Service, Ingress, HPA, and ServiceAccount. |
| **mychart/values.yaml** | Default configuration values for the chart. |
| **run.sh** | Script to run Chart Museum locally and publish charts via `helm repo add` / `helm push`. |

---

### 🧪 Helm Chart Testing and Validation (`Helm Chart Testing and Validation/`)
| File | Purpose |
|------|----------|
| **tests/run.sh** | Executes `helm lint` and `helm test` against a sample chart. |
| **tests/test-connection.yaml** | Example test pod manifest for Helm’s built-in test mechanism. |

---

### 🧰 Helm Lab (`Helm Lab/`)
A self-contained lab that walks through building a Docker image, deploying it with Helm, and promoting versions automatically.

| File | Purpose |
|------|----------|
| **Dockerfile / app.py / requirements.txt** | Sample application for containerization and deployment. |
| **setup_k8s_helm.sh** | Bootstraps Helm in a Kubernetes cluster and installs the lab chart. |
| **promote_chart_version.sh** | Automates bumping the chart version in `Chart.yaml`. |
| **promote_app_version.sh / promote_both_versions.sh** | Demonstrates coordinated version promotion for both app and chart. |
| **PROJECT_OVERVIEW.md / app_README.md / requirements_README.md** | Documentation for the lab’s architecture and tasks. |
| **doc_cache.json / generate_docs_async.log** | Supporting files for chart documentation generation. |

---

### 🔌 Helm Plugins and Extensions (`Helm Plugins and Extensions/`)
| File | Purpose |
|------|----------|
| **run.sh** | Installs and demonstrates useful plugins (e.g., `helm-diff`, `helm-secrets`, `helm-unittest`, `helm-push`). |

---

### 🗂️ Managing Chart Dependencies (`Managing Chart Dependencies/`)
| File | Purpose |
|------|----------|
| **Chart.yaml** | Example of declaring dependencies between charts. |
| **run.sh** | Demonstrates running `helm dependency update` and deploying dependent charts. |

---

### 🌍 Real-World Case Studies and Hands-On Labs (`Real-World Case Studies and Hands-On Labs/`)
| File | Purpose |
|------|----------|
| **README.md** | Overview of a real-world Helm use case. |
| **mychart/** | Example chart configured for multiple environments (`dev`, `prod`). |
| **values-dev.yaml / values-prod.yaml** | Environment-specific values demonstrating Helm’s flexibility in CI/CD pipelines. |

---

### 🔐 Security Best Practices for Helm (`Security Best Practices for Helm/`)
| File | Purpose |
|------|----------|
| **secrets.yaml** | Demonstrates secure secret templating in Helm. |
| **run.sh** | Automates scanning or validating charts for secret misconfigurations and policy compliance. |

---

## 🧩 Additional Example Files

| File | Description |
|------|--------------|
| **helm-repo.yaml** | YAML manifest example for defining a Helm repository resource. |
| **templates/deployment.yaml** | Generic deployment template shared by other modules. |
| **Helm-Oci-Demo.sh** | Script demonstrating OCI-based chart storage (push/pull via container registries). |

---

## ⚙️ Quick Start

```bash
# 1. Package a Helm chart
helm package Chart\ Museum/mychart

# 2. Run Chart Museum locally
bash Chart\ Museum/run.sh

# 3. Add the repo and install
helm repo add myrepo http://localhost:8080
helm install demo myrepo/mychart

# 4. Test the chart
bash Helm\ Chart\ Testing\ and\ Validation/tests/run.sh
