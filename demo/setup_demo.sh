#!/bin/bash

NUM=$1

cd ../onboard

for n in $(seq 1 $NUM)
do
  ./onboard_user.sh user-0$n
done
