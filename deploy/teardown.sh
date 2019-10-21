#!/bin/sh

kubectl delete machinedeployment --all
kubectl delete clusters --selector cluster-type=workload

