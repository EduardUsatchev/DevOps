#!/bin/bash
set -e

CURRENT_APP_VERSION=$(yq eval '.appVersion' myapp-chart/Chart.yaml)
CURRENT_CHART_VERSION=$(yq eval '.version' myapp-chart/Chart.yaml)

echo "🔍 Current app version: $CURRENT_APP_VERSION"
echo "🔍 Current chart version: $CURRENT_CHART_VERSION"

NEW_APP_VERSION=$1
NEW_CHART_VERSION=$2

if [[ -z "$NEW_APP_VERSION" || -z "$NEW_CHART_VERSION" ]]; then
    echo "❌ Error: Please provide both new app and chart versions!"
    exit 1
fi

echo "🚀 Updating appVersion to $NEW_APP_VERSION and chart version to $NEW_CHART_VERSION..."
yq eval -i ".appVersion = "$NEW_APP_VERSION"" myapp-chart/Chart.yaml
yq eval -i ".version = "$NEW_CHART_VERSION"" myapp-chart/Chart.yaml

helm package myapp-chart
curl --data-binary "@myapp-$NEW_CHART_VERSION.tgz" http://localhost:8080/api/charts

git add myapp-chart/Chart.yaml
git commit -m "🚀 Promoted appVersion to $NEW_APP_VERSION and Helm chart version to $NEW_CHART_VERSION"
git push origin main

echo "✅ Both app and Helm chart versions promoted successfully!"
