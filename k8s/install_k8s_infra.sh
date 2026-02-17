#!/bin/bash
set -e

echo "=== Installing K8s Infrastructure Agent ==="
echo "This sends Kubernetes node/pod/container metrics to your local SigNoz."

# Add SigNoz Helm repo (if not already added)
helm repo add signoz https://charts.signoz.io 2>/dev/null || true
helm repo update

# Create namespace if needed
kubectl create namespace platform 2>/dev/null || true

# Install k8s-infra chart — sends metrics to local SigNoz via host.docker.internal
helm upgrade --install k8s-infra signoz/k8s-infra \
  -n platform \
  --set signozApiKey="" \
  --set otelCollectorEndpoint="host.docker.internal:4317" \
  --set otelInsecure=true \
  --timeout 5m

echo ""
echo "=== K8s Infrastructure Agent installed! ==="
echo "Kubernetes metrics will now appear in SigNoz at http://localhost:3301"
