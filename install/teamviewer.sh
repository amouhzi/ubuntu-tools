#!/bin/bash

cd /tmp

rm teamviewer_linux.deb

wget "http://download.teamviewer.com/download/teamviewer_linux.deb"

sudo dpkg -i teamviewer_linux.deb

sudo apt-get install -fy
