#!/bin/bash

echo "\n Installation of Git:"
echo "-----------------------------------------\n"

apt-get install -y git

echo "\n Installation of Nginx Module for Webmin:"
echo "-----------------------------------------\n"

cd /usr/share/webmin

git clone git@github.com:anezi/nginx-webmin.git nginx

# Restart the webmin service
echo "\nRestart the webmin service"
service webmin restart
