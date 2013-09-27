#!/bin/bash

cd /tmp
sudo apt-get install -y php5-cli curl
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
