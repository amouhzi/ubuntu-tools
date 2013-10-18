#!/bin/bash

cd /tmp

echo "\nDownloading of teamviewer 7:"
wget "http://download.teamviewer.com/download/version_7x/teamviewer_linux_x64.deb"

echo "\nInstallation of teamviewer 7:"
sudo dpkg -i teamviewer_linux_x64.deb

echo "\nInstallation of missing packages:"
sudo apt-get install -fy
