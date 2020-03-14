#!/bin/sh -v

set -e

for d in workload-cluster management-cluster cli-tools
do
  (cd $d && ./teardown.sh)
done
