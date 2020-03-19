#!/bin/sh -v

set -e

kubectl scale deploy kuard --replicas=3 --record=true

