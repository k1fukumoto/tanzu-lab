#!/bin/bash

USERS=$*

cd ../onboard

for u in $USERS
do
    ./teardown.sh $u
done

