#!/bin/bash
set -e

echo "=== Building & Deploying App to Kubernetes ==="

echo "1. Building Backend Docker Image..."
docker build -t python-app:latest ./blockchain_block

echo "2. Deploying Postgres..."
kubectl apply -f k8s/postgres.yaml

echo "3. Waiting for Postgres to be ready..."
kubectl wait --for=condition=available --timeout=120s deployment/postgres

echo "4. Deploying Backend..."
kubectl apply -f k8s/backend.yaml

# Check if frontend directory exists and has content
if [ -d "./antigraviti_react" ] && [ "$(ls -A ./antigraviti_react 2>/dev/null)" ]; then
    echo "5. Building Frontend Docker Image..."
    docker build -t frontend:latest ./antigraviti_react
    echo "6. Deploying Frontend..."
    kubectl apply -f k8s/frontend.yaml
else
    echo "5. Frontend directory empty or missing. Skipping Frontend deployment."
fi

echo ""
echo "=== Deployment complete! ==="
echo "Check status: kubectl get pods"
echo "Access app:   kubectl port-forward svc/python-app 5000:5000"
