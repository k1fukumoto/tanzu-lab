#!/bin/sh

export DEBIAN_FRONTEND=noninteractive 

sudo apt-get -y update

sudo apt-get install -y \
  apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get -y update
sudo apt-get -y remove docker-ce-cli
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo gpasswd -a k8s-admin docker

sudo docker run hello-world
