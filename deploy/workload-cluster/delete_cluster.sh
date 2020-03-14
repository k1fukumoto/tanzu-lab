#!/bin/sh -v

set -e

export PATH=$PATH:../cli-tools

kubectl delete cluster vsphere-quickstart

