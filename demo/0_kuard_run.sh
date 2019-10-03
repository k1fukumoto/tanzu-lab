#!/bin/bash

kubectl run --image=gcr.io/kuar-demo/kuard-amd64:blue kuard
kubectl expose deploy kuard --type LoadBalancer --port 8080
IPADDR=$(kubectl get svc kuard -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
echo Kubernetes-Up-and-Running demo application can be accessed at http://$IPADDR:8080
