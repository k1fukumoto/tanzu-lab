#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 CLUSTER"
    exit
fi

export CLUSTER=$1

./generate_manifests.sh $CLUSTER


export KUBECONFIG="$(pwd)/out/management/kubeconfig"

kubectl apply -f ./out/$CLUSTER/cluster.yaml
kubectl apply -f ./out/$CLUSTER/controlplane.yaml
kubectl apply -f ./out/$CLUSTER/machinedeployment.yaml
#kubectl apply -f ./out/$CLUSTER/addons.yaml

