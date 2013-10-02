#!/bin/bash

sudo apt-get install yasm

WUSER="www-data"
WHOME="/var/www"

cd $WHOME
sudo -u $WUSER -H mkdir ffmpeg_sources

cd ffmpeg_sources
sudo -u $WUSER -H git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git

cd fdk-aac
sudo -u $WUSER -H autoreconf -fiv
sudo -u $WUSER -H ./configure --prefix="$WHOME/ffmpeg_build" --disable-shared
sudo -u $WUSER -H make
sudo -u $WUSER -H make install
sudo -u $WUSER -H make distclean

