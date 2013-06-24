#!/bin/bash

cd /tmp
wget "http://download.teamviewer.com/download/teamviewer_linux_x64.deb"

dpkg -i "http://download.teamviewer.com/download/teamviewer_linux_x64.deb"

apt-get install -fy
