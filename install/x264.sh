#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied."
    exit
fi

if [ $# -eq 1 ]
  then
    echo "Missing arguments."
    exit
fi

if [ -z "$1" ]
  then
    echo "No argument supplied."
    exit
fi

if [ -z "$2" ]
  then
    echo "No argument supplied."
    exit
fi

# Installing dependencies
aget yasm

WUSER="$1"
WHOME="$2"

if [ ! -d "$WHOME/ffmpeg_sources" ]; then
  mkdir $WHOME/ffmpeg_sources
fi

cd $WHOME/ffmpeg_sources
sudo -u $WUSER -H git clone --depth 1 git://git.videolan.org/x264.git

cd x264
sudo -u $WUSER -H ./configure --prefix="$WHOME/ffmpeg_build" --bindir="$WHOME/bin" --enable-static
sudo -u $WUSER -H make
sudo -u $WUSER -H make install
sudo -u $WUSER -H make distclean
