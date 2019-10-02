#!/bin/bash

USER=$1

cat tanzu-lab/deploy/envvars.sh | RSAKEY=$(cat /home/$USER/.ssh/id_rsa.pub) ./onboard/embed_key.py
