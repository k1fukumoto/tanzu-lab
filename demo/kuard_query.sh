#!/bin/bash

while true
do
  POD=$(curl -s http://10.108.5.201:8080 | grep pageCon | sed s/^.*\{/{/ |  python3 -c "import sys, json; print(json.load(sys.stdin)['hostname'])")
  IMAGE=$(kubectl get pod $POD -o jsonpath="{.spec.containers[0]['image']}")

  echo
  echo "->" $POD '('$IMAGE')'
  kubectl get pod --selector run=kuard
  sleep 1
done
