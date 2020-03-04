#!/bin/sh

set -e

export PATH=$PATH:bin

clusterctl config cluster vsphere-quickstart \
    --infrastructure vsphere:v0.6.0-rc.1 \
    --kubernetes-version v1.17.3 \
    --control-plane-machine-count 1 \
    --worker-machine-count 1 | kubectl apply -f - 

