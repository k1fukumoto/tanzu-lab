#!/bin/sh

set -e

./create_cluster.sh
./wait_for_machines.sh
