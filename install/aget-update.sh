#!/bin/bash

echo -n "Download of aget script ... "
sudo wget -q sh.anezi.net/aget -O /usr/local/bin/aget

if [ -f /usr/local/bin/aget ]
then
    echo "OK."
    sudo chmod +x /usr/local/bin/aget
    echo "aget updated successfuly."
else
    echo "ERROR."
fi
