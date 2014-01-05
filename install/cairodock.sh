#!/bin/bash

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "\n Cairo-dock installation:"
echo "---------------------\n"

echo "GPG Key:"

wget -q http://repository.glx-dock.org/cairo-dock.gpg -O- | sudo apt-key add - 

echo "deb http://download.tuxfamily.org/glxdock/repository/ubuntu $(lsb_release -sc) cairo-dock ## Cairo-Dock-Stable" > /etc/apt/sources.list.d/cairodock.list

# Updating packages informations
echo "\nUpdating packages informations"
apt-get update

# Installation of Cairo-dock
echo "\nInstallation of cairo-dock"
apt-get install -y cairo-dock cairo-dock-plug-ins
