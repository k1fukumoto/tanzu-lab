#!/bin/sh

set -e

wget https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod 777 ./kubectl

[ -d bin ] || (mkdir bin && chmod 777 bin)
mv ./kubectl bin/

bin/kubectl version --client
