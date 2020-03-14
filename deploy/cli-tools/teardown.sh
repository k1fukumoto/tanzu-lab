#!/bin/sh -v

set -e

for c in docker kind kubectl clusterctl
do
  rm -fv $c
done
