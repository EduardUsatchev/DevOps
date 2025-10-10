# 🚀 GitOps Examples Repository

This directory demonstrates **GitOps workflows and patterns** using the leading tools in modern Kubernetes automation — **Argo CD**, **Flux**, **Helmfile**, and **Secret Management** solutions such as Sealed Secrets and Vault.

It is designed for **hands-on DevOps and Kubernetes training**, showing how to declaratively deploy, synchronize, and secure applications through GitOps principles.

---

## 📁 Directory Overview

| Folder | Description |
|---------|-------------|
| **argoCD_/** | Advanced Argo CD use cases including ApplicationSets, Helm integration, automated sync, rollout strategies, and sync waves. |
| **argocd/** | Core Argo CD Helm chart and manifest examples (simple to advanced) showing how to deploy and manage Kubernetes apps with Argo. |
| **flux/** | Flux CD examples demonstrating GitOps automation using `HelmRelease`, `Kustomization`, and repository syncing. |
| **flux-old/** | Legacy Flux v1 / Helm Operator configurations for historical understanding and comparison. |
| **helmfile/** | Demonstrates Helmfile for multi-chart, multi-environment deployments with variables, hooks, and nested Helmfile structures. |
| **secret-management/** | Secure secret handling in GitOps environments — using both **Sealed Secrets** (encryption in Git) and **Vault** (external secret stores). |

---

## 🧠 Key Learning Objectives

- Understand **declarative delivery** with Argo CD and Flux.
- Implement **multi-environment** management (`dev`, `stage`, `prod`) using overlays and Helm values.
- Automate deployments via **Helm**, **Kustomize**, and **Terraform** under a GitOps model.
- Manage application **rollouts**, **sync policies**, and **health checks** declaratively.
- Handle **secrets securely** in a GitOps workflow using Sealed Secrets or HashiCorp Vault.

---

## 🧩 Detailed Module Structure

### 🧭 Argo CD Advanced Examples (`argoCD_/`)
| Subfolder | Purpose |
|------------|----------|
| **argocd-advanced-example/appset/** | Demonstrates **ApplicationSet** — generate multiple Argo CD applications dynamically. |
| **argocd-advanced-example/auto-sync-policy/** | Enables **automated synchronization** (self-healing deployments). |
| **argocd-advanced-example/helm-values/** | Uses **Helm value overrides** within Argo CD applications. |
| **argocd-advanced-example/rollouts/** | Canary/Rolling updates with **Argo Rollouts** controller. |
| **argocd-advanced-example/sync-waves-hooks/** | Orchestrates multi-phase deployments using **sync waves** and **resource hooks**. |
| **ex-1/k8s-manifests/** | Basic Argo CD deployment using raw manifests (`deployment.yaml`, `service.yaml`, etc.). |
| **ex-2/base & overlays/** | Demonstrates **Kustomize overlays** for `dev` and `prod` environments. |
| **setup/** | Shell script (`cmd.sh`) to install or bootstrap Argo CD in a cluster. |

---

### 🧱 Argo CD Core (`argocd/`)
| File / Folder | Purpose |
|----------------|----------|
| **mychart/** | Example Helm chart managed via Argo CD, includes templates, values files, and chart metadata. |
| **values-dev.yaml / values-prod.yaml** | Show environment-specific Helm values. |
| **new/** & **old/** | Compare old vs. new deployment styles. |
| **commands.txt** | CLI reference for Argo CD operations (e.g., `argocd app create`, `argocd app sync`). |
| **podinfo.yaml / redis.yaml** | Standalone manifest examples for quick deployment tests. |

---

### ⚡ Flux (`flux/` and `flux-old/`)
| Folder | Description |
|---------|-------------|
| **flux/docker-desktop/** | Demonstrates a local **Flux installation** syncing manifests and Helm releases to a Docker Desktop cluster. |
| **flux/podinfo-repo.yaml** | Declares a Git repository source for Flux. |
| **flux/podinfo-helmrelease.yaml** | Deploys a Helm chart via Flux `HelmRelease` CRD. |
| **flux-old/** | Contains pre-Flux v2 examples (Helm Operator, legacy `values-flux.yaml` and `installation.txt`). Useful for understanding the evolution of Flux. |

---

### 🧩 Helmfile (`helmfile/`)
| File | Description |
|------|-------------|
| **00-helmfile.yaml** | Base Helmfile example demonstrating simple chart management. |
| **01-env-vars.yaml** | Inject environment variables into Helmfile releases. |
| **02-helmfile-envvars-values.yaml** | Mix values files and environment variables. |
| **03-hooks-helmfile.yaml** | Demonstrates Helmfile hooks for pre/post-deploy tasks. |
| **04-environments-helmfile.yaml** | Manage multiple environments (`dev`, `prod`, etc.). |
| **05-nested-helmfile.yaml** | Shows nested Helmfile usage for modular deployments. |
| **05-redis-dep.yaml** | Helmfile dependency management for Redis charts. |
| **commands.txt / installation.txt** | Setup and usage reference for Helmfile CLI. |

---

### 🔐 Secret Management (`secret-management/`)
| Tool | Description |
|------|-------------|
| **sealed-secrets/** | Uses Bitnami Sealed Secrets to safely commit encrypted Kubernetes secrets into Git. |
| **vault/** | Integrates **HashiCorp Vault** with Kubernetes using External Secrets to dynamically inject secrets into pods. |
| **main.tf** | Example Terraform file configuring Vault integration. |
| **externalsecret.yaml / secretstore.yaml** | Define External Secrets and SecretStore CRDs. |
| **pod-with-secret.yaml / secret.yaml** | Demo manifests consuming secrets in workloads. |

---

## 🧱 Prerequisites

Before running the examples, make sure you have:

- A running **Kubernetes cluster** (minikube, k3s, kind, or cloud).
- Installed CLIs:
  - `kubectl`
  - `helm`
  - `argocd` (for Argo CD)
  - `flux` (for Flux CD)
  - `helmfile` (for Helmfile examples)
- Access to a **GitHub / GitLab** repo (for real GitOps demo).

---

## 🧪 Quick Start

```bash
# 1. Install Argo CD or Flux
bash argoCD_/setup/cmd.sh          # installs Argo CD
# or
flux install                       # installs Flux v2

# 2. Apply sample manifests
kubectl apply -f argoCD_/ex-1/k8s-manifests/

# 3. Explore the Argo CD UI
argocd login <server-url>
argocd app list
