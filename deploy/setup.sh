#!/bin/sh -v

set -e

for d in cli-tools management-cluster workload-cluster 
do
  (cd $d && ./setup.sh)
done
