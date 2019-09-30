#!/bin/bash

while true
do
  curl -s http://10.108.5.211:8080 | grep pageCon | sed s/^.*\{/{/ |  python3 -c "import sys, json; print(json.load(sys.stdin)['hostname'])"
  sleep 1
done
