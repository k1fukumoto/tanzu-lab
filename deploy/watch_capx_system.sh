#!/bin/sh

kubectl logs -n capv-system $(kubectl -n capv-system get po -o jsonpath='{.items..metadata.name}') -f
