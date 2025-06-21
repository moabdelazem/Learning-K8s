#!/bin/bash

echo "🚀 Deploying Nginx with ConfigMap..."

# Apply the ConfigMap first
echo "📁 Applying ConfigMap..."
kubectl apply -f config-map.yml

# Apply the deployment
echo "🔧 Applying Deployment..."
kubectl apply -f nginx-deployment.yml

# Apply the service
echo "🌐 Applying Service..."
kubectl apply -f nginx-service.yml

# Restart the deployment to pick up new ConfigMap
echo "🔄 Restarting deployment to pick up new configuration..."
kubectl rollout restart deployment/nginx-app

# Wait for rollout to complete
echo "⏳ Waiting for deployment to be ready..."
kubectl rollout status deployment/nginx-app

# Show the status
echo "📊 Deployment Status:"
kubectl get pods -l app=nginx
kubectl get svc nginx-service

echo ""
echo "✅ Deployment complete!"
echo "🌐 Access your application at: http://localhost:30080"
echo "🔍 To check pod logs: kubectl logs -l app=nginx"
