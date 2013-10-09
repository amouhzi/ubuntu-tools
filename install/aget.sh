#!/bin/bash

version=0.6
vdate=2013-10-09

echo
echo "Anezi Get version $version date $vdate."
echo "      Ubuntu applications installer."
echo

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

echo "We will install: (program:arg1:arg2:....)"
for i in $*
do
  echo " - '$i'"
done

for i in $*
do

  old=$IFS
  IFS=":"
  set $i
  
  program=$1
  
  echo "Program to install: '$program'"
  
  args=""
  
  shift
  
  for i in $*
  do
      args="$args $i"
  done
  
  echo "Arguments: '$args'"
  
  IFS="$old"
  
  echo -n "Trying to download $program ... "
  
  wget -q "sh.anezi.net/$program" -O "$program"
  
  if [ ! -f "$program" ]
  then
      echo "Fails!"
      exit
  fi
  
  echo "OK."
  
  echo "Executing $program ... "
  
  sh "$program$args"
  
  echo -n "Removing $program ... "
  rm $program
  echo "OK."
  
done

echo "Finish!"
