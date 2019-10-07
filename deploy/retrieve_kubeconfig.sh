#!/bin/bash

export CLUSTER=$1

kubectl get secret $CLUSTER-kubeconfig \
  -o=jsonpath='{.data.value}' | \
  { base64 -d 2>/dev/null || base64 -D; } \
  >./out/$CLUSTER/kubeconfig
