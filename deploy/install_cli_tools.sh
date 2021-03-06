#!/bin/bash

install_clusterctl() {
  wget https://github.com/kubernetes-sigs/cluster-api/releases/download/v0.2.1/clusterctl-linux-amd64 -O clusterctl
  chmod +x clusterctl
  sudo mv clusterctl /usr/local/bin
}

install_docker() {
  sudo apt-get update

  sudo apt-get install \
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

  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io

  sudo docker run hello-world
}

install_go() {
  VERSION=1.13
  OS=linux
  ARCH=amd64

  wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
  sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
}

install_gcc() {
  sudo apt install gcc
}

export PATH=$PATH:/usr/local/go/bin

install_kind() {
  GO111MODULE="on" go get sigs.k8s.io/kind@v0.5.1
}
export PATH=$PATH:$HOME/go/bin

install_kubectl() {
  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
}

install_helm() {
  wget https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz
  tar -zxvf helm*.tar.gz
  sudo mv linux-amd64/helm /usr/local/bin/helm
}

install_mc() {
  wget https://dl.min.io/client/mc/release/linux-amd64/mc
  chmod +x mc
  sudo mv mc /usr/local/bin
}

install_velero() {
  wget https://github.com/vmware-tanzu/velero/releases/download/v1.1.0/velero-v1.1.0-linux-amd64.tar.gz
  tar zxvf velero-v1.1.0-linux-amd64.tar.gz
  chmod +x velero-v1.1.0-linux-amd64/velero
  sudo mv velero-v1.1.0-linux-amd64/velero /usr/local/bin
}

TOOLS=$*
if [ "$TOOLS" == "all" ]
then
  TOOLS="clusterctl docker go gcc kind kubectl helm mc velero"
fi

for t in $TOOLS
do
  install_$t
  echo -n "Finish installing $t. Continue?"
  read a
done


