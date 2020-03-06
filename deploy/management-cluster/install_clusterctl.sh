#!/bin/sh

set -e

wget https://github.com/kubernetes-sigs/cluster-api/releases/download/v0.3.0-rc.2/clusterctl-linux-amd64

chmod 777 ./clusterctl-linux-amd64

[ -d bin ] || (mkdir bin && chmod 777 bin)
mv ./clusterctl-linux-amd64 bin/clusterctl

[ -d ~/.cluster-api ] || (mkdir ~/.cluster-api && chmod 777 ~/.cluster-api)
cp ./clusterctl.yaml ~/.cluster-api

