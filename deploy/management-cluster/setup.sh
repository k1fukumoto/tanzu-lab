#!/bin/sh

set -e

./install_clusterctl.sh
./install_docker.sh
./install_kind.sh
./install_kubectl.sh

./create_cluster.sh
./create_workload_cluster.sh
