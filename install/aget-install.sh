#!/bin/bash

echo -n "Download of aget script ... "
sudo wget -q https://raw.githubusercontent.com/amouhzi/ubuntu-tools/master/install/aget -O /usr/local/bin/aget

if [ -f /usr/local/bin/aget ]
then
    echo "OK."
    sudo chmod +x /usr/local/bin/aget
    echo "You can now use aget to install or update applications."
else
    echo "ERROR."
fi
