#!/bin/bash

USER=$1
cd /home/$USER/tanzu-lab

cat ./deploy/envvars.sh | RSAKEY=$(cat /home/$USER/.ssh/id_rsa.pub) ./onboard/embed_key.py > ./deploy/envvars_$USER.sh
