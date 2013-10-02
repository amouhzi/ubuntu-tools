#!/bin/bash

cd /tmp
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv
./configure
make
make install
make distclean
