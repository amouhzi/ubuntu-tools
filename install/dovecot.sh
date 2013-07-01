#!/bin/bash

echo "\n Dovecot installation:"
echo "---------------------\n"

apt-get install -y dovecot-common dovecot-pop3d dovecot-mysql dovecot-imapd dovecot-sieve dovecot-lmtpd dovecot-managesieved
