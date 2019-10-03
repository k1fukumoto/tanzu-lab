#!/bin/bash

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

USER=$1
CLUSTER=$2

generate_manifest() {
  sudo docker run --rm \
    -v "$(pwd)":/out \
    -v "$(pwd)/envvars_$USER.sh":/envvars.txt:ro \
    gcr.io/cluster-api-provider-vsphere/release/manifests:v0.5.0 \
    -c $CLUSTER
}

# rm -frv out
generate_manifest $USER $CLUSTER

