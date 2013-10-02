#!/bin/bash

echo "Download of aget script ... "
sudo wget -q sh.anezi.net/aget -O /usr/local/bin/aget

if [ -f /usr/local/bin/aget ]
then
    echo "OK."
else
    echo "ERROR."
fi

sudo chmod +x /usr/local/bin/aget
