#!/bin/sh

set -e

export PATH=$PATH:bin

clusterctl init \
  --core cluster-api:v0.3.0-rc.2 \
  --bootstrap kubeadm:v0.3.0-rc.2 \
  --control-plane kubeadm:v0.3.0-rc.2 \
  --infrastructure vsphere:v0.6.0-rc.1
