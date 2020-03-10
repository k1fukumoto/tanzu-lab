#!/bin/sh

set -e

export PATH=$PATH:bin

kind create cluster

chmod a+r $HOME/.kube/config
