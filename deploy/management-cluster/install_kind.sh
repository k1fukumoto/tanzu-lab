#!/bin/sh

set -e

wget https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-Linux-amd64
chmod 777 ./kind-Linux-amd64

[ -d bin ] || mkdir bin
mv ./kind-Linux-amd64 bin/kind
