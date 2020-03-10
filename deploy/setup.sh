#!/bin/sh -v

set -e

for d in cli-tools management-cluster workload-cluster 
do
  (cd cli-tools && ./setup.sh)
  (cd management-cluster && ./setup.sh)
  (cd workload-cluster && ./setup.sh)
done
