#!/bin/sh

set -e

export PATH=$PATH:bin

# generate manifests
docker run --rm \
  -v "$(pwd)":/out \
  -v "$(pwd)/envvars.txt":/envvars.txt:ro \
  gcr.io/cluster-api-provider-vsphere/release/manifests:v0.5.4 \
  -c workload-cluster-1

export KUBECONFIG="$(pwd)/out/management-cluster/kubeconfig"
kubectl apply -f ./out/workload-cluster-1/cluster.yaml
kubectl apply -f ./out/workload-cluster-1/controlplane.yaml
kubectl apply -f ./out/workload-cluster-1/machinedeployment.yaml
