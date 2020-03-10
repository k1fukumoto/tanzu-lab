#!/bin/sh

set -e

export PATH=$PATH:bin

clusterctl init --infrastructure vsphere
