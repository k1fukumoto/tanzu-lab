#!/bin/sh -v

set -e

./install_docker.sh
./install_kind.sh
./install_kubectl.sh
./install_clusterctl.sh
