#!/bin/sh

set -e

wget https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-Linux-amd64
chmod +x ./kind-Linux-amd64

[ -d bin ] || mkdir bin
mv ./kind-Linux-amd64 bin/kind
