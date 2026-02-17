#!/bin/bash
set -e

echo "=== Starting SigNoz (Docker Compose) ==="
cd /home/gevorg/Desktop/signoz/deploy/docker
docker compose up -d

echo ""
echo "=== SigNoz is starting! ==="
echo "UI:             http://localhost:3301"
echo "OTel gRPC:      localhost:4317"
echo "OTel HTTP:      localhost:4318"
echo ""
echo "Check status:   cd /home/gevorg/Desktop/signoz/deploy/docker && docker compose ps"
