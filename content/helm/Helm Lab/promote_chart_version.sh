#!/bin/bash
set -e

CURRENT_VERSION=$(yq eval '.version' myapp-chart/Chart.yaml)
echo "🔍 Current chart version: $CURRENT_VERSION"

NEW_VERSION=$1
if [[ -z "$NEW_VERSION" ]]; then
    echo "❌ Error: Please provide a new chart version!"
    exit 1
fi

echo "🚀 Updating Helm chart version to $NEW_VERSION..."
yq eval -i ".version = "$NEW_VERSION"" myapp-chart/Chart.yaml

helm package myapp-chart
curl --data-binary "@myapp-$NEW_VERSION.tgz" http://localhost:8080/api/charts

git add myapp-chart/Chart.yaml
git commit -m "📦 Promoted Helm chart version to $NEW_VERSION"
git push origin main

echo "✅ Helm chart version promoted successfully!"
