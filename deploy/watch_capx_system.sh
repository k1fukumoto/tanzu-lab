#!/bin/sh

CLUSTER=$1

export KUBECONFIG=$HOME/.kube/kind-config-$CLUSTER

kubectl logs -n capv-system $(kubectl -n capv-system get po -o jsonpath='{.items..metadata.name}') -f
