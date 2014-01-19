#!/bin/bash

cd /tmp

wget "http://download.teamviewer.com/download/teamviewer_linux.deb"

sudo dpkg -i teamviewer_linux.deb

sudo apt-get install -fy
