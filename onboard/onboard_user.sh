#!/bin/bash

USER=$1
PASS='VMware1!'

sudo adduser $USER --disabled-password --gecos ""
echo "$USER:$PASS" | sudo chpasswd
sudo gpasswd -a $USER docker
sudo su $USER  -c 'ssh-keygen -t rsa -N "" -f /home/$USER/.ssh/id_rsa'

find_management_kubecfg() {
  for f in $(ls $HOME/tanzu-lab/deploy/management-cluster/out/*/kubeconfig)
  do
    echo $f
    exit
  done
  echo 'WARNING: No management cluster found'
  exit 1
}

MCFG=$(find_management_kubecfg)

cd /home/$USER
sudo su $USER -c 'git clone https://github.com/k1fukumoto/tanzu-lab.git'

cd tanzu-lab/onboard
sudo su $USER -c "./replace_key.sh $USER"

cd ../deploy/workload-cluster
sudo KUBECONFIG=$MCFG WORKLOAD_CLUSTER=w-$USER scons

WCFG=/home/$USER/tanzu-lab/deploy/workload-cluster/out/w-$USER/kubeconfig
sudo chown $USER $WCFG
sudo chgrp $USER $WCFG
sudo chmod o-r $WCFG

sudo sh -c "echo export KUBECONFIG=$WCFG >> /home/$USER/.bashrc"
sudo sh -c "echo . /home/$USER/tanzu-lab/deploy/shortcuts.sh >> /home/$USER/.bashrc"

