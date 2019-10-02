#!/bin/bash

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin


generate_manifest() {
  sudo docker run --rm \
    -v "$(pwd)":/out \
    -v "$(pwd)/envvars.sh":/envvars.txt:ro \
    gcr.io/cluster-api-provider-vsphere/release/manifests:v0.5.0 \
    -c $1
}

# rm -frv out
generate_manifest management-cluster
generate_manifest workload-cluster-1
generate_manifest workload-cluster-2

