#!/bin/sh

set -e

export PATH=$PATH:bin

# cluster API
kubectl create -f https://github.com/kubernetes-sigs/cluster-api/releases/download/v0.2.10/cluster-api-components.yaml

# bootstrap provider
kubectl create -f https://github.com/kubernetes-sigs/cluster-api-bootstrap-provider-kubeadm/releases/download/v0.1.6/bootstrap-components.yaml

# infrastructure provider
kubectl create -f ./credential.yaml
kubectl create -f https://github.com/kubernetes-sigs/cluster-api-provider-vsphere/releases/download/v0.5.5/infrastructure-components.yaml
