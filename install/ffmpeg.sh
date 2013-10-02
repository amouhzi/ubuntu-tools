#!/bin/bash

sudo apt-get install -y libass-dev

WUSER="www-data"
WHOME="/var/www"

cd $WHOME
sudo -u $WUSER -H mkdir ffmpeg_sources

cd ffmpeg_sources

sudo -u $WUSER -H git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
PKG_CONFIG_PATH="$WHOME/ffmpeg_build/lib/pkgconfig"
export PKG_CONFIG_PATH
sudo -u $WUSER -H ./configure --prefix="$WHOME/ffmpeg_build" \
  --extra-cflags="-I$WHOME/ffmpeg_build/include" --extra-ldflags="-L$WHOME/ffmpeg_build/lib" \
  --bindir="$WHOME/bin" --extra-libs="-ldl" --enable-gpl --enable-libass --enable-libfdk-aac \
  --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libvpx \
  --enable-libx264 --enable-nonfree --enable-x11grab
sudo -u $WUSER -H make
sudo -u $WUSER -H make install
sudo -u $WUSER -H make distclean
sudo -u $WUSER -H hash -r
