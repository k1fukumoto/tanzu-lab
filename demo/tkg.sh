#!/bin/sh

set -e

rm -frv ~/.kube ~/.tkg

# first run will always fail
tkg init -v 5 --infrastructure vsphere:v0.6.0 --flavor dev || true
cat ../deploy/cli-tools/tkg.yaml >> ~/.tkg/config.yaml
cat ~/.tkg/config.yaml
read a

# second run with fully populated config file
tkg init -v 5 --infrastructure vsphere:v0.6.0 --flavor dev
kubectl get nodes
read a

# creat workload cluster
tkg create cluster dev-01 -b --flavor=dev --kubernetes-version=1.16.2 --worker-machine-count=3
tkg get cluster
kubectl config get-contexts
kubectl get nodes
read a

./0_kuard_run.sh
./1_kuard_scale.sh

time tkg create cluster dev-02 -b --flavor=dev --kubernetes-version=1.16.2 --worker-machine-count=3

