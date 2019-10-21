#!/bin/sh

WORKLOAD_CLUSTER=$1

echo -n "Start waiting for machines to be ready"
while true
do
    RUNNING=1
    for s in $(kubectl get machines --no-headers | awk '{print $NF}')
    do
	if [ "$s" != "running" ]; then
	    RUNNING=0
	fi 
    done
    if [ $RUNNING -eq 1 ]; then
	break
    fi
    echo -n "."
    sleep 3
done

kubectl get secret $WORKLOAD_CLUSTER-kubeconfig \
  -o=jsonpath='{.data.value}' | \
  { base64 -d 2>/dev/null || base64 -D; } \
  > out/$WORKLOAD_CLUSTER/kubeconfig

kubectl label cluster $WORKLOAD_CLUSTER cluster-type=workload

export KUBECONFIG=out/$WORKLOAD_CLUSTER/kubeconfig

kubectl apply -f out/$WORKLOAD_CLUSTER/addons.yaml

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f ../metallb.yaml # this manifest needs to be generated from envvars.sh


