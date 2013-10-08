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

prog=$1

echo -n "Trying to download $prog ... "

wget -q sh.anezi.net/$prog -O $prog

if [ ! -f "$prog" ]
then
    echo "Fails!"
    exit
fi

echo "OK."

old="$IFS"
IFS=":"
set "$2"
IFS="$old"

args=""
 
for i in $*
do
    args="$args $i"
done

sh $prog $args
rm $prog
