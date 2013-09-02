#!/bin/bash

cd /tmp

sudo apt-get install virtualbox

sudo usermod -G vboxusers -a $USER

version=$(VBoxManage --version|cut -dr -f1|cut -d'_' -f1) && wget -c http://download.virtualbox.org/virtualbox/$version/Oracle_VM_VirtualBox_Extension_Pack-$version.vbox-extpack

version=$(VBoxManage --version|cut -dr -f1|cut -d'_' -f1) && VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$version.vbox-extpack

rm *.vbox-extpack
