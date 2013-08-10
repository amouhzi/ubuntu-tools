#!/bin/bash

echo "\n NVIDIA Drivers installation:"
echo "-------------------------------\n"

cd /tmp

wget http://us.download.nvidia.com/XFree86/Linux-x86_64/325.15/NVIDIA-Linux-x86_64-325.15.run

sudo service lightdm stop

sudo service x11-common stop

sudo sh ./NVIDIA-Linux-x86_64-325.15.run

sudo reboot
