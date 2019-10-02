#!/bin/bash

kubectl set image deployment/kuard kuard=gcr.io/kuar-demo/kuard-amd64:green --record=true
