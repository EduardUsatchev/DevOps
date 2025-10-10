# 🧩 GitHub Actions Workflows

This directory contains a comprehensive set of **GitHub Actions workflow examples** for automating CI/CD, security checks, and infrastructure tasks.  
Each `.yaml` file demonstrates a specific automation pattern — from basic builds to advanced reusable workflows.

---

## 📁 Directory Overview

| File | Purpose |
|------|----------|
| **01-example.yaml** | A minimal, introductory workflow demonstrating the structure of a basic GitHub Actions file. |
| **bad-action.yaml** | Demonstrates common mistakes or anti-patterns in workflow definitions — useful for learning what *not* to do. |
| **basic-workflow.yaml** | A simple CI pipeline showing code checkout, build, and test steps. |
| **branch-workflow.yaml** | Runs jobs only on specific branches (e.g., `main`, `develop`) — useful for multi-branch development. |
| **building-pushing-docker-images.yaml** | End-to-end example for building a Docker image and pushing it to Docker Hub or GitHub Container Registry. |
| **call-reusable-workflow.yml** | Demonstrates how to invoke a reusable workflow defined elsewhere in your repo or organization. |
| **continuous-integration.yaml** | A full CI pipeline including build, lint, test, and artifact upload steps. |
| **cron-scheduling.yaml** | Shows how to use `on.schedule` (cron syntax) to run periodic jobs (e.g., nightly tests or cleanup). |
| **docker-build-push.yaml** | Another Docker CI/CD flow — optimized for separate build and push jobs, often with matrix builds. |
| **docker-build.yaml** | Simplified workflow to just build Docker images (no push step). |
| **lambda.yaml** | Example of deploying or testing AWS Lambda functions using GitHub Actions and AWS CLI. |
| **matrix-builds.yaml** | Demonstrates matrix testing (e.g., run across multiple OS, Python or Node versions). |
| **matrix.yaml** | Alternate matrix example for build/test permutations. |
| **outputs-artifacts.yaml** | Shows how to produce, store, and use build outputs and artifacts across jobs. |
| **pr-comment.yaml** | Posts automated comments on Pull Requests — e.g., build status or review reminders. |
| **pull-request.yaml** | Runs tests or validations automatically when a PR is opened or updated. |
| **reusable-workflow.yml** | Defines a reusable workflow that can be called by other workflows within this or other repos. |
| **secrets.yaml** | Demonstrates secure secret usage from GitHub’s encrypted secrets store. |
| **security-management.yaml** | Integrates security scans (e.g., Dependabot, CodeQL, Trivy) into CI pipelines. |
| **seq-and-para.yaml** | Demonstrates sequential and parallel job execution within one workflow. |
| **static-website-github-pages.yaml** | Automates deployment of static websites (e.g., HTML/CSS/JS) to GitHub Pages. |
| **upload-artifact.yaml** | Shows how to store build/test outputs as downloadable artifacts. |
| **upload-download.yaml** | Demonstrates both uploading and retrieving artifacts between jobs. |

---

## ⚙️ How to Use

1. Copy any file into `.github/workflows/` in your repository.
2. Adjust environment variables, triggers (`on:`), and job steps as needed.
3. Commit and push — GitHub Actions will automatically run according to the trigger definitions.

Example:
```bash
cp workflows/continuous-integration.yaml .github/workflows/ci.yaml
git add .github/workflows/ci.yaml
git commit -m "Add CI workflow"
git push
