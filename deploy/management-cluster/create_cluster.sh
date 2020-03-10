#!/bin/sh

set -e

export PATH=$PATH:../cli-tools

kind create cluster

chmod a+r $HOME/.kube/config
