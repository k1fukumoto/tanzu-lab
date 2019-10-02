#!/bin/bash


while true
do
  index=$(rand -M 2)
  kubectl delete pod $(kubectl get po -o jsonpath="{.items[$index].metadata.name}")
done
