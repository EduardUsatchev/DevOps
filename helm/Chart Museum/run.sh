#!/bin/bash
set -e

# Enable OCI experimental features (if needed for other operations)
export HELM_EXPERIMENTAL_OCI=1

# Define local storage directory for ChartMuseum
LOCAL_STORAGE_DIR="./charts"

# Create the local storage directory if it doesn't exist
if [ ! -d "$LOCAL_STORAGE_DIR" ]; then
  echo "Creating local storage directory at $LOCAL_STORAGE_DIR..."
  mkdir -p "$LOCAL_STORAGE_DIR"
fi

# 1. Start ChartMuseum with local storage enabled and mount the local directory
echo "Starting ChartMuseum with local storage..."
docker run -d -p 8080:8080 --name chartmuseum \
  -e STORAGE=local \
  -e STORAGE_LOCAL_ROOTDIR=/charts \
  -v "$(pwd)/charts":/charts \
  chartmuseum/chartmuseum:latest

# Give ChartMuseum a moment to start
sleep 5

# 2. Check if the Helm chart directory "mychart" exists; if not, create it.
if [ ! -d "mychart" ]; then
  echo "Directory 'mychart' not found. Creating a sample Helm chart..."
  helm create mychart
  echo "Sample Helm chart 'mychart' created successfully."
fi

# 3. Package your Helm chart
echo "Packaging Helm chart..."
helm package mychart

# The package command creates a file like 'mychart-0.1.0.tgz'
CHART_PACKAGE=$(ls mychart-*.tgz | head -n 1)
if [ -z "$CHART_PACKAGE" ]; then
  echo "Error: Chart package not found!"
  exit 1
fi
echo "Chart package created: ${CHART_PACKAGE}"

# 4. Upload the packaged chart to ChartMuseum using curl.
echo "Uploading chart package to ChartMuseum via curl..."
curl --data-binary "@${CHART_PACKAGE}" http://localhost:8080/api/charts

# 5. Verify that the chart is stored by fetching the index file.
echo "Fetching the ChartMuseum index file..."
curl http://localhost:8080/api/charts

echo "ChartMuseum demo completed successfully."
