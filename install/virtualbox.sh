#!/bin/bash

sudo apt-get install virtualbox virtualbox-guest-additions-iso

sudo usermod -G vboxusers -a $USER

cd /tmp

version=$(VBoxManage --version|cut -dr -f1|cut -d'_' -f1)

wget -c http://download.virtualbox.org/virtualbox/$version/Oracle_VM_VirtualBox_Extension_Pack-$version.vbox-extpack

VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$version.vbox-extpack

rm *.vbox-extpack
