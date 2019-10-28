#!/bin/bash

USERS=$*

cd ../onboard

for u in $USERS
do
  ./onboard_user.sh $u
done
