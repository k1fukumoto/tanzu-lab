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
  go get -v sigs.k8s.io/kind
}
export PATH=$PATH:$HOME/go/bin

install_kubectl() {
  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  mv ./kubectl /usr/local/bin/kubectl
}

$1


