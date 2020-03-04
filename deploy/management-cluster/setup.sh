#!/bin/sh

set -e

./install_docker.sh
./install_kind.sh
./install_kubectl.sh
./create_cluster.sh
./configure_cluster.sh
