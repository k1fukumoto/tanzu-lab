#!/bin/bash

export KUBECONFIG="$(pwd)/out/management-cluster/kubeconfig"

kubectl apply -f ./out/workload-cluster-1/cluster.yaml
kubectl apply -f ./out/workload-cluster-1/controlplane.yaml
kubectl apply -f ./out/workload-cluster-1/machinedeployment.yaml
kubectl apply -f ./out/workload-cluster-1/addons.yaml
