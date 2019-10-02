#!/bin/bash

kubectl scale deploy kuard --replicas=3 --record=true

