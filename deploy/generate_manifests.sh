#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 CLUSTER"
    exit
fi

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

CLUSTER=$1

cd $HOME/tanzu-lab/deploy

generate_manifest() {
  docker run --rm \
    -v "$(pwd)":/out \
    -v "$(pwd)/envvars.sh":/envvars.txt:ro \
    gcr.io/cluster-api-provider-vsphere/release/manifests:v0.5.1 \
    -c $CLUSTER
}

patch_manifest() {
  tmp=$(mktemp /tmp/$0.XXXX)
  for f in $(ls out/$CLUSTER/*.yaml)
  do
    sed $'s/sddc-cgw-horizon-cpsbu-desktops-1/\'sddc-cgw-horizon-cpsbu-desktops-1 \'/g' $f > $tmp
    cp $tmp $f
  done
  rm $tmp
}

# rm -frv out
generate_manifest
patch_manifest

