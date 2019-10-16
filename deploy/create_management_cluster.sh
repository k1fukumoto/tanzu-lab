#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 CLUSTER"
    exit
fi


export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

CLUSTER=$1

    # sudo env "PATH=$PATH" clusterctl create cluster \
clusterctl create cluster \
  --bootstrap-type kind \
  --bootstrap-flags name=$CLUSTER \
  --cluster ./management-cluster/out/$CLUSTER/cluster.yaml \
  --machines ./management-cluster/out/$CLUSTER/controlplane.yaml \
  --provider-components ./management-cluster/out/$CLUSTER/provider-components.yaml \
  --addon-components ./management-cluster/out/$CLUSTER/addons.yaml \
  --kubeconfig-out ./management-cluster/out/$CLUSTER/kubeconfig \
  -v 6
