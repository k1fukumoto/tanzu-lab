#!/bin/bash

USER=$1
PASS='VMware1!'

sudo adduser $USER --disabled-password --gecos ""
echo "$USER:$PASS" | sudo chpasswd
sudo su $USER  -c 'ssh-keygen -t rsa -N "" -f /home/$USER/.ssh/id_rsa'

cd /home/$USER
sudo su $USER -c 'git clone https://github.com/k1fukumoto/tanzu-lab.git'
sudo su $USER -c "./tanzu-lab/onboard/onboard_user_2.sh $USER"
