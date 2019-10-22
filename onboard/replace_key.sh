#!/bin/sh

USER=$1

tmp=$(mktemp /tmp/replace_key.XXXX)
cat ../deploy/envvars.sh | RSAKEY=$(cat /home/$USER/.ssh/id_rsa.pub) embed_key.py > $tmp
mv $tmp ../deploy/envvars.sh
