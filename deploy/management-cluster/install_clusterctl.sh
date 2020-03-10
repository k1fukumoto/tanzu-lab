#!/bin/sh

set -e
. ./defines.sh

wget https://github.com/kubernetes-sigs/cluster-api/releases/download/$VERSION_CLUSTERCTL/clusterctl-linux-amd64

chmod 777 ./clusterctl-linux-amd64

[ -d bin ] || (mkdir bin && chmod 777 bin)
mv ./clusterctl-linux-amd64 bin/clusterctl

[ -d ~/.cluster-api ] || (mkdir ~/.cluster-api && chmod 777 ~/.cluster-api)
cp ./clusterctl.yaml ~/.cluster-api

