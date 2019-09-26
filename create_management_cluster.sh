#!/bin/bash

export PATH=$PATH:$HOME/go/bin

clusterctl create cluster \
  --bootstrap-type kind \
  --bootstrap-flags name=management-cluster \
  --cluster ./out/management-cluster/cluster.yaml \
  --machines ./out/management-cluster/controlplane.yaml \
  --provider-components ./out/management-cluster/provider-components.yaml \
  --addon-components ./out/management-cluster/addons.yaml \
  --kubeconfig-out ./out/management-cluster/kubeconfig \
  -v 6
