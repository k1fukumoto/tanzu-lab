#!/bin/sh

set -e

export PATH=$PATH:../cli-tools

clusterctl init --infrastructure vsphere

#tkg init -v 3 --infrastructure vsphere:v0.6.0 --flavor dev
