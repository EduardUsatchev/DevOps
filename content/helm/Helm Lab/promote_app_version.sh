#!/bin/bash
set -e

CURRENT_APP_VERSION=$(yq eval '.appVersion' myapp-chart/Chart.yaml)
echo "🔍 Current app version: $CURRENT_APP_VERSION"

NEW_APP_VERSION=$1
if [[ -z "$NEW_APP_VERSION" ]]; then
    echo "❌ Error: Please provide a new app version!"
    exit 1
fi

echo "🚀 Updating appVersion to $NEW_APP_VERSION..."
yq eval -i ".appVersion = "$NEW_APP_VERSION"" myapp-chart/Chart.yaml

git add myapp-chart/Chart.yaml
git commit -m "🔖 Updated appVersion to $NEW_APP_VERSION"
git push origin main

echo "✅ App version promoted successfully!"
