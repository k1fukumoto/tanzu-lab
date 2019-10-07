#!/bin/bash

export CLUSTER=$1

cd $HOME/tanzu-lab/deploy

KUBECONFIG=./out/management/kubeconfig \
  kubectl get secret $CLUSTER-kubeconfig \
  -o=jsonpath='{.data.value}' | \
  { base64 -d 2>/dev/null || base64 -D; } \
  >./out/$CLUSTER/kubeconfig

export KUBECONFIG=./out/$CLUSTER/kubeconfig

kubectl apply -f ./out/$CLUSTER/addons.yaml

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f metallb.yaml # this manifest needs to be generated from envvars.sh
