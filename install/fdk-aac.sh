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

WUSER="$1"
WHOME="$2"

if [ ! -d "$WHOME/ffmpeg_sources" ]; then
  mkdir $WHOME/ffmpeg_sources
fi

# Installing dependencies
sudo apt-get install -y autoconf libtool

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

