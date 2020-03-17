#!/bin/sh

set -e

rm -frv ~/.kube ~/.tkg

tkg init -v 5 --infrastructure vsphere:v0.6.0 --flavor dev
cat ../deploy/cli-tools/tkg.yaml >> ~/.tkg/config.yaml
vi ~/.tkg/config.yaml

time tkg init -v 5 --infrastructure vsphere:v0.6.0 --flavor dev
kubectl get nodes

time tkg create cluster dev-01 -b --flavor=dev --kubernetes-version=1.16.2 --worker-machine-count=3
tkg get cluster
kubectl config get-contexts
kubectl get nodes

./0_kuard_run.sh
./1_kuard_scale.sh
