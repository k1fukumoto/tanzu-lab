#!/bin/bash

DEPLOY=../deploy

. $DEPLOY/shortcuts.sh
sudo echo This script needs root privledge

for u in $*
do 
    export KUBECONFIG=$DEPLOY/management-cluster/out/$(find_management_cluster)/kubeconfig
    for md in $(kubectl get machinedeployments -o=custom-columns=:.metadata.name | grep w-$u)
    do
	kubectl delete machinedeployments $md
    done

    for c in $(kubectl get cluster -o=custom-columns=:.metadata.name | grep w-$u)
    do
	kubectl delete cluster $c
    done

    sudo deluser $u
    sudo rm -frv /home/$u
done
