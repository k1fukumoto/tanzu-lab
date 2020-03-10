#!/bin/sh

set -e

export DEBIAN_FRONTEND=noninteractive 

apt-get -y update

apt-get install -y \
  apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get -y update
apt-get -y remove docker-ce-cli
apt-get -y install docker-ce docker-ce-cli containerd.io

docker run hello-world
