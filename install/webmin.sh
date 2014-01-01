#!/bin/bash

echo "\n Webmin installation:"
echo "---------------------\n"

echo "GPG Key:"

cd /tmp
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add < jcameron-key.asc

echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list

# Updating packages informations
echo "\nUpdating packages informations"
apt-get update

# Installation of webmin
echo "\nInstallation of webmin"
apt-get install -y webmin

# Start the webmin service
echo "\nStart the webmin service"
service webmin start
