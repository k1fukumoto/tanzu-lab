#!/bin/bash

MANIFEST=$1

tmp=$(mktemp /tmp/$0.XXXX)
echo sed 's/sddc-cgw-horizon-cpsbu-desktops-1/\"sddc-cgw-horizon-cpsbu-desktops-1 \"/g' $MANIFEST > $tmp
#mv $tmp $MANIFEST
