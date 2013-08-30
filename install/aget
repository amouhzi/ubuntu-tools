#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied."
    exit
fi

if [ -z "$1" ]
  then
    echo "No argument supplied."
    exit
fi

cd /tmp

wget sh.anezi.net/$1
sudo sh $1
