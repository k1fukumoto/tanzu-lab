#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 MANAGEMENT WORKLOAD"
    exit
fi

export MANAGEMENT=$1
export WORKLOAD=$2

if [ -d ./out/$MANAGEMENT ]; then
  echo Management clustger exists. Deploy workload cluster
else
  echo Start deploying management cluster
  ./generate_manifests.sh $MANAGEMENT
  ./create_management_cluster.sh $MANAGEMENT
fi

./generate_manifests.sh $WORKLOAD
export KUBECONFIG="$(pwd)/out/$MANAGEMENT/kubeconfig"

kubectl apply -f ./out/$WORKLOAD/cluster.yaml
kubectl apply -f ./out/$WORKLOAD/controlplane.yaml
kubectl apply -f ./out/$WORKLOAD/machinedeployment.yaml

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

KUBECONFIG=./out/$MANAGEMENT/kubeconfig \
  kubectl get secret $WORKLOAD-kubeconfig \
  -o=jsonpath='{.data.value}' | \
  { base64 -d 2>/dev/null || base64 -D; } \
  >./out/$WORKLOAD/kubeconfig

export KUBECONFIG=./out/$WORKLOAD/kubeconfig

kubectl apply -f ./out/$WORKLOAD/addons.yaml

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f metallb.yaml # this manifest needs to be generated from envvars.sh
