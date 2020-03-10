#!/bin/sh

set -e

export PATH=$PATH:bin

clusterctl config cluster vsphere-quickstart \
    --infrastructure vsphere \
    --kubernetes-version v1.17.3 \
    --control-plane-machine-count 1 \
    --worker-machine-count 3 | kubectl apply -f - 

