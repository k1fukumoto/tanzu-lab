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

CFG=$(find_management_kubecfg)
sudo chmod a+r $CFG

cd /home/$USER
sudo su $USER -c 'git clone https://github.com/k1fukumoto/tanzu-lab.git'
sudo su $USER -c "./tanzu-lab/onboard/onboard_user_2.sh $USER $CFG"

