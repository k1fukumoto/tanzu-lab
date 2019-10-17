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
  --cluster ./out/$CLUSTER/cluster.yaml \
  --machines ./out/$CLUSTER/controlplane.yaml \
  --provider-components ./out/$CLUSTER/provider-components.yaml \
  --addon-components ./out/$CLUSTER/addons.yaml \
  --kubeconfig-out ./out/$CLUSTER/kubeconfig \
  -v 6

kubectl label cluster $CLUSTER cluster-type=management
