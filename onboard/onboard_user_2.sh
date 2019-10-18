#!/bin/bash

USER=$1
cd /home/$USER/tanzu-lab

tmp=$(mktemp /tmp/onboard_user.XXXX)
cat ./deploy/envvars.sh | RSAKEY=$(cat /home/$USER/.ssh/id_rsa.pub) ./onboard/embed_key.py > $tmp
mv $tmp ./deploy/envvars.sh

cd ./deploy
WORKLOAD_CLUSTER=w-$USER scons workload-cluster

