#!/bin/bash

kubectl get secret workload-cluster-1-kubeconfig \
  -o=jsonpath='{.data.value}' | \
  { base64 -d 2>/dev/null || base64 -D; } \
  >./out/workload-cluster-1/kubeconfig
