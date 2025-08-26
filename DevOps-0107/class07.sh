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
######################################################################################################
# https://github.com/EduardUsatchev/DevOps/blob/main/github-actions/workflows/seq-and-para.yaml
######################################################################################################
# https://github.com/EduardUsatchev/DevOps/blob/main/github-actions/workflows/secrets.yaml
##########################################################################################
# http://github.com/EduardUsatchev/DevOps/blob/main/github-actions/workflows/matrix.yaml | settings/secrets/actions
1. requirements.txt:
flask
pytest
##############################
2.New file called: test_sample.py
def test_one_equals_one():
    assert 1 == 1
##########################################
3. Dockerfile:
# Use an official Python runtime
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy source code
COPY app.py .

# Run the app
CMD ["python", "app.py"]
#########3
# https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax#jobsjob_idstrategymatrixinclude
# https://docs.pytest.org/en/stable/

##########################################################################################
https://github.com/EduardUsatchev/DevOps/blob/main/github-actions/workflows/docker-build-push.yaml
Add file: app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from GitHub Actions + Docker!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
######    ######

# https://github.com/EduardUsatchev/DevOps/blob/main/github-actions/workflows/pr-comment.yaml
