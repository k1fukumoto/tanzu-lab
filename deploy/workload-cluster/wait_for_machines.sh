#!/bin/sh

set -e

PATH=$PATH:../cli-tools

echo -n "Start waiting for machines to be ready"
while true
do
    RUNNING=1
    echo -n "."
    for s in $(kubectl get machines --no-headers | awk '{print $NF}')
    do
	if [ "$s" != "Running" ]; then
	    RUNNING=0
	fi 
    done
    if [ $RUNNING -eq 1 ]; then
	echo
	echo "All machines are running"
	exit 0
    fi
    sleep 3
done
exit 1

#kubectl get secret $WORKLOAD_CLUSTER-kubeconfig \
#  -o=jsonpath='{.data.value}' | \
#  { base64 -d 2>/dev/null || base64 -D; } \
#  > out/$WORKLOAD_CLUSTER/kubeconfig

#kubectl label cluster $WORKLOAD_CLUSTER cluster-type=workload

#export KUBECONFIG=out/$WORKLOAD_CLUSTER/kubeconfig

#kubectl apply -f out/$WORKLOAD_CLUSTER/addons.yaml

#kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
#kubectl apply -f ../metallb.yaml # this manifest needs to be generated from envvars.sh


