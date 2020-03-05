#!/bin/sh

set -e
export PATH=$PATH:bin

namespace=$1

podname=$(kubectl get pod --namespace $namespace -o jsonpath='{.items[0].metadata.name}')

kubectl logs $podname -c manager --namespace $namespace

