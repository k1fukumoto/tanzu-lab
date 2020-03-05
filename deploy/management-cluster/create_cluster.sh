#!/bin/sh

set -e

export PATH=$PATH:bin

# generate manifests
docker run --rm \
  -v "$(pwd)":/out \
  -v "$(pwd)/envvars.txt":/envvars.txt:ro \
  gcr.io/cluster-api-provider-vsphere/release/manifests:v0.5.4 \
  -c management-cluster

# create cluster
clusterctl create cluster --v 5 \
  --bootstrap-type kind \
  --bootstrap-flags name=management-cluster \
  --cluster ./out/management-cluster/cluster.yaml \
  --machines ./out/management-cluster/controlplane.yaml \
  --provider-components ./out/management-cluster/provider-components.yaml \
  --addon-components ./out/management-cluster/addons.yaml \
  --kubeconfig-out ./out/management-cluster/kubeconfig

