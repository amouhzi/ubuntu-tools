Build status: BETA

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
wget -O- sh.anezi.net/install-aget | sudo bash -
```
Important note
--------------
You can only install supported applications.
Supported application
---------------------
* <code>chromium</code> => Chromium Browser with languages support.
* <code>composer</code> => Globally Install Composer
* <code>lamp</code> => Apache2, MySql, PHP, Xdebug
* <code>oracle-java8</code>
* <code>oracle-java-6</code>
* <code>teamviewer64</code> => Teamviewer 8 64bit (Latest)
* <code>teamviewer7-amd64</code> => Teamviewer 7 64bit
* <code>webmin</code>

Helps:

SSH
===

ssh-copy-id -i ~/.ssh/id_rsa.pub remote-host

Locales
=======

locale-gen fr_BE.UTF-8
dpkg-reconfigure locales
