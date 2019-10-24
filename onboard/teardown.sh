#!/bin/bash

for u in $*
do 
  sudo deluser $u
  sudo rm -frv /home/$u
done
