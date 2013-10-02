#!/bin/bash

WUSER="www-data"
WHOME="/var/www"

cd $WHOME
sudo -u $WUSER -H git clone --depth 1 git://git.videolan.org/x264.git

cd x264
sudo -u $WUSER -H ./configure --prefix="$WHOME/ffmpeg_build" --bindir="$WHOME/bin" --enable-static
sudo -u $WUSER -H make
sudo -u $WUSER -H make install
sudo -u $WUSER -H make distclean
