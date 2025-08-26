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
#####################################3
