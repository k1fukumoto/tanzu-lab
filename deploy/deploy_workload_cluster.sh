#!/bin/bash

export MANAGEMENT_CLUSTER=$1
export WORKLOAD_CLUSTER=$2

export KUBECONFIG="$(pwd)/out/$MANAGEMENT_CLUSTER/kubeconfig"

kubectl apply -f ./out/$WORKLOAD_CLUSTER/cluster.yaml
kubectl apply -f ./out/$WORKLOAD_CLUSTER/controlplane.yaml
kubectl apply -f ./out/$WORKLOAD_CLUSTER/machinedeployment.yaml
#kubectl apply -f ./out/$WORKLOAD_CLUSTER/addons.yaml
