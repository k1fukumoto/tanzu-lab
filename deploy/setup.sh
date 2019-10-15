#!/bin/sh

sudo apt install -y debconf-utils
echo 'libssl1.1	libraries/restart-without-asking	boolean	true' | sudo debconf-set-selections
echo 'libssl1.1:amd64	libraries/restart-without-asking	boolean	true' | sudo debconf-selections

sudo apt install -y scons
sudo scons cli-tools
