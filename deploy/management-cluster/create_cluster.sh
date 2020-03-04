#!/bin/sh

set -e

export PATH=$PATH:bin

kind create cluster --name=clusterapi
kubectl cluster-info --context kind-clusterapi

