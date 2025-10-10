# Real-World Case Studies and Hands-On Labs

This folder contains a sample Helm chart ("mychart") demonstrating a multi-environment deployment scenario. In this example, we use separate values files for development and production to show how environment-specific configuration can be managed.

**Topics Covered:**
- Environment-specific overrides using `values-dev.yaml` and `values-prod.yaml`
- Using a single chart to deploy to multiple namespaces/environments
- How to upgrade and roll back releases easily using Helm

**Deployment Commands:**

- **For Development:**
  ```bash
  helm install myapp-dev ./mychart -f values-dev.yaml --namespace dev

- **For Production:**
  ```bash
    helm upgrade --install myapp-prod ./mychart -f values-prod.yaml --namespace prod
