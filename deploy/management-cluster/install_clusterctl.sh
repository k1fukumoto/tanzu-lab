#!/bin/sh

set -e

CLUSTERCTL_VERSION=v0.2.10

wget https://github.com/kubernetes-sigs/cluster-api/releases/download/$CLUSTERCTL_VERSION/clusterctl-linux-amd64

chmod +x ./clusterctl-linux-amd64

[ -d bin ] || (mkdir bin && chmod 777 bin)
mv ./clusterctl-linux-amd64 bin/clusterctl

[ -d ~/.cluster-api ] || (mkdir ~/.cluster-api && chmod 777 ~/.cluster-api)
cp ./clusterctl.yaml ~/.cluster-api

