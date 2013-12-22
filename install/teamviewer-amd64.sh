#!/bin/bash

cd /tmp

wget "http://launchpadlibrarian.net/139194357/lib32asound2_1.0.25-4ubuntu4_amd64.deb"

sudo dpkg -i lib32asound2_1.0.25-4ubuntu4_amd64.deb

sudo apt-get install -fy

wget "http://download.teamviewer.com/download/teamviewer_linux_x64.deb"

sudo dpkg -i teamviewer_linux_x64.deb

sudo apt-get install -fy
