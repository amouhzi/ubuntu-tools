#!/bin/bash

cd /tmp
mkdir fdk-aac
cd fdk-aac
wget https://github.com/mstorsjo/fdk-aac/archive/v0.1.2.zip
unzip v0.1.2.zip
cd fdk-aac-0.1.2
autoreconf -fiv
./configure
make
sudo make install
make distclean
cd ..
cd ..
rm -r fdk-aac
