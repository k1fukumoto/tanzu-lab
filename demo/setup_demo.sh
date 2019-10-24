#!/bin/bash

START=$1
END=$2

cd ../onboard

for n in $(seq $START $END)
do
  ./onboard_user.sh user$n
done
