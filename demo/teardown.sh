#!/bin/bash

USER=$1

DEPLOY=../deploy

. $DEPLOY/shortcuts.sh

sudo echo This script needs root privledge

export KUBECONFIG=$DEPLOY/management-cluster/out/$(find_management_cluster)/kubeconfig
for md in $(kubectl get machinedeployments -o=custom-columns=:.metadata.name | grep w-$USER)
do
  kubectl delete machinedeployments $md
done

for c in $(kubectl get cluster -o=custom-columns=:.metadata.name | grep w-$USER)
do
  kubectl delete cluster $c
done

cd ../onboard
./teardown.sh $USER

#export KUBECONFIG=$DEPLOY/workload-cluster/out/$1/kubeconfig


# delete all pods
#kubectl delete all --selector run=kuard
