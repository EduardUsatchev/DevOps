# 🧱 Jenkins CI/CD Labs

This directory contains **hands-on Jenkins examples** covering every stage of a modern CI/CD pipeline — from local Docker builds to Kubernetes deployments and advanced pipeline configurations.

Each folder demonstrates a specific **DevOps automation scenario** using Jenkins Declarative and Scripted pipelines.

---

## 📁 Directory Overview

| Folder / File | Description |
|----------------|-------------|
| **ci-build-test/** | Demonstrates a simple CI pipeline that builds a Docker image, runs unit tests, and validates an app. |
| **ci_cd/** | A complete end-to-end CI/CD pipeline integrating Docker builds, Kubernetes manifests, and deployment automation. |
| **ci_docker_build_01/** | Basic Jenkins example for building a Docker image and verifying dependencies — ideal for first-time setup. |
| **jenkins-deploy-02/** | Demonstrates multi-style Jenkinsfiles (Declarative, Scripted, and Freestyle) with advanced configuration. |
| **jenkins_deploy/** | Contains a full Jenkins deployment setup using Docker Compose, plugins, and custom entrypoints. |
| **jenkins-validator.sh** | Script to validate Jenkins configurations and pipeline syntax before running. |

---

## 🧩 Module Breakdown

### ⚙️ 1. CI Build & Test (`ci-build-test/`)
| File | Description |
|------|--------------|
| **Dockerfile** | Defines a simple Python app container. |
| **Jenkinsfile** | Pipeline for building, testing, and validating the application. |
| **app.py** | Python application under test. |
| **requirements.txt** | Python dependencies for the build. |
| **test-app.py** | Unit test validating `app.py`. |

🧠 *Goal:* Learn how Jenkins performs continuous integration — build, test, and feedback loop.

---

### 🛠️ 2. Full CI/CD Example (`ci_cd/`)
| File / Folder | Description |
|----------------|-------------|
| **Jenkinsfile** | Orchestrates build → test → deploy → cleanup stages. |
| **app/** | Application source folder containing code and tests. |
| **ci-cd/deploy.yaml** | Kubernetes deployment manifest applied after build. |
| **k8s_manifests/** | Contains `deployment.yaml`, `account.yaml`, and `jenkins-k8s-config.yaml` for cluster deployment. |
| **hosts / hosts.template** | Example for dynamic agent assignment or remote build execution. |
| **run-minikube.sh** | Spins up a local Minikube cluster to test Kubernetes integration. |

🧠 *Goal:* Simulate a complete CI/CD flow — Jenkins → Docker → Kubernetes.

---

### 🐳 3. Docker Build Example (`ci_docker_build_01/`)
| File | Description |
|------|--------------|
| **Dockerfile** | Defines the containerized Python app. |
| **Jenkinsfile** | Automates Docker image build and push. |
| **app.py / requirements.txt** | Example microservice code. |

🧠 *Goal:* Understand Docker integration within Jenkins pipelines.

---

### 🚀 4. Jenkins Deploy Configs (`jenkins-deploy-02/`)
| File / Folder | Description |
|----------------|-------------|
| **jenkins/** | Contains multiple Jenkins pipeline examples and configuration files. |
| **Jenkinsfile, Jenkinsfile02, Jenkinsfile03** | Different pipeline styles: Declarative, Scripted, and hybrid. |
| **agent.jar** | Jenkins agent binary (for connecting worker nodes). |
| **docker-compose.yml** | Runs Jenkins server locally with dependencies. |
| **resize_disk.py** | Example of invoking Python logic within a Jenkins job. |
| **declerativeFile / scriptedFile / windows_batch.txt** | Demonstrates cross-platform and multi-script automation. |

🧠 *Goal:* Compare Jenkins pipeline syntaxes and deploy Jenkins locally with Docker.

---

### 🧰 5. Jenkins Deployment Environment (`jenkins_deploy/`)
| File | Description |
|------|--------------|
| **Dockerfile** | Builds a Jenkins server image with pre-installed plugins. |
| **plugins.txt** | List of plugins installed automatically at container build time. |
| **docker-compose.yml** | Brings up Jenkins master and volumes for persistence. |
| **entrypoint.sh** | Custom entrypoint script for initializing Jenkins environment. |
| **jenkins-deploy.sh** | Automates local Jenkins setup, builds, and restarts. |
| **agent.jar** | Binary for agent connections (mounted at runtime). |

🧠 *Goal:* Deploy and configure Jenkins locally or in containers with persistent configuration.

---

### 🧮 6. Validator Script
| File | Description |
|------|--------------|
| **jenkins-validator.sh** | Validates Jenkins pipeline syntax, plugin availability, and environment readiness before execution. |

Run it before executing complex pipelines:
```bash
bash jenkins-validator.sh
