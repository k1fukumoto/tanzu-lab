#!/bin/bash

USER=$1
M_CFG=$2

cd /home/$USER/tanzu-lab

tmp=$(mktemp /tmp/onboard_user.XXXX)
cat ./deploy/envvars.sh | RSAKEY=$(cat /home/$USER/.ssh/id_rsa.pub) ./onboard/embed_key.py > $tmp
mv $tmp ./deploy/envvars.sh

cd ./deploy/workload-cluster
KUBECONFIG=$M_CFG WORKLOAD_CLUSTER=w-$USER scons

echo "export KUBECONFIG=$HOME/tanzu-lab/deploy/workload-cluster/out/w-$USER/kubeconfig" >> $HOME/.bashrc
echo ". $HOME/tanzu-lab/deploy/shortcuts.sh" >> $HOME/.bashrc

