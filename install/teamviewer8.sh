#!/bin/bash

cd /tmp

wget "http://download.teamviewer.com/download/version_8x/teamviewer_linux.deb"

sudo dpkg -i teamviewer_linux.deb

sudo apt-get install -fy
