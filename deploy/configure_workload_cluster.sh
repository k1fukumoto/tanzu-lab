#!/bin/bash

export CLUSTER=$1

export KUBECONFIG="$HOME/tanzu-lab/deploy/out/$CLUSTER/kubeconfig"

kubectl apply -f ./out/$CLUSTER/addons.yaml

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f metallb.yaml # this manifest needs to be generated from envvars.sh
