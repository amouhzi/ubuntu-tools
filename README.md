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
cd /tmp
wget sh.anezi.net/aget
sudo mv aget /usr/local/bin
sudo chmod +x aget
```
Important note
--------------
You can only install supported applications.
Supported application
---------------------
* <code>chromium</code> => Chromium Browser with languages support.
* <code>oracle-java8</code>
* <code>oraclejava6</code>
* <code>teamviewer64</code> => Teamviewer 8 64bit (Latest)
* <code>teamviewer7_64</code> => Teamviewer 7 64bit
* <code>webmin</code>

Helps:

SSH
===

ssh-copy-id -i ~/.ssh/id_rsa.pub remote-host

Locales
=======

locale-gen fr_BE.UTF-8
dpkg-reconfigure locales
