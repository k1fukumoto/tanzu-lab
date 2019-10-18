#!/bin/bash

NUM=$1

for n in $(seq 1 $NUM)
do
  WORKLOAD_CLUSTER="w-0$n" scons workload-cluster
done
