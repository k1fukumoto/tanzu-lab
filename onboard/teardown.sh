#!/bin/bash

USER=$1

sudo deluser $USER
echo -n "Continue to delete /home/$USER ?"
read a
sudo rm -fr /home/$USER
