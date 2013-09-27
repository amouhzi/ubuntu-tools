#!/bin/bash

cd /tmp
sudo apt-get install php5-cli
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
