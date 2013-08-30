Anezi GET (aget)
================
Anezi GET script helps you to install ubuntu application with one command line.

Example: To install webmin, just use this command line:

```bash
# aget webmin
```

Installation
------------

```bash
cd /tmp
wget sh.anezi.net/aget
sudo mv aget /usr/local/bin
sudo chmod +x aget
```

Important note
--------------

You can only install supported applications.


Helps:

SSH
===

ssh-copy-id -i ~/.ssh/id_rsa.pub remote-host


Webmin
======

https://raw.github.com/anezi/ubuntu-tools/master/install/webmin.sh


Locales
=======

locale-gen fr_BE.UTF-8
dpkg-reconfigure locales
