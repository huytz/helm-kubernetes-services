#!/bin/bash

# Local testing script for Helm charts
set -e

echo "🧪 Testing Helm charts locally..."

# Check if Helm is installed
if ! command -v helm &> /dev/null; then
    echo "❌ Helm is not installed. Please install Helm first."
    exit 1
fi

# Test each chart
for chart in charts/*/; do
    if [ -f "$chart/Chart.yaml" ]; then
        chart_name=$(basename "$chart")
        echo "📦 Testing chart: $chart_name"
        
        # Lint the chart
        echo "  🔍 Linting..."
        helm lint "$chart"
        
        # Test template rendering
        echo "  🎨 Testing template rendering..."
        helm template test-release "$chart" --dry-run
        
        echo "  ✅ Chart $chart_name passed all tests"
        echo ""
    fi
done

echo "🎉 All charts passed local testing!"
