# Create repository in Github for the class
# Link to the materials: https://github.com/EduardUsatchev/DevOps/tree/main/github-actions/workflows
# Create file : .github/workflows/01-example.yaml
name: Run Tests

on:
  push:
    branches:
        - test
  workflow_dispatch:

jobs:
  test:
    runs-on: ubuntu-latest
    container: python:3.11
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: show files
        run: |
          ls -ltr
          python --version
#####################################
# https://github.com/EduardUsatchev/class-7/settings/actions/runners | per repo: settings/actions/runners
# https://docs.github.com/en/billing/concepts/product-billing/github-actions
# https://github.com/actions/runner-images
# Dont forget to DISABLE unused workflows !!

# https://github.com/EduardUsatchev/DevOps/blob/main/github-actions/workflows/seq-and-para.yaml
# https://github.com/EduardUsatchev/DevOps/blob/main/github-actions/workflows/secrets.yaml
# http://github.com/EduardUsatchev/DevOps/blob/main/github-actions/workflows/matrix.yaml
