#!/bin/sh

set -e

export PATH=$PATH:../cli-tools

clusterctl init --infrastructure vsphere
