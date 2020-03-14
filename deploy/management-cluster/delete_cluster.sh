#!/bin/sh

set -e

export PATH=$PATH:../cli-tools

kind delete cluster --name "kind"

