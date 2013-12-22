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
wget -q -O - sh.anezi.net/aget-install | sudo bash -
```
Important note
--------------
You can only install supported applications.
Supported application
---------------------
* <code>chromium</code>          => Chromium Browser with languages support.
* <code>composer</code>          => Globally Install Composer.
* <code>fdk-aac</code>           => AAC audio encoder.
* <code>ffmpeg</code>            =>
* <code>lamp</code>              => Apache2, MySql, PHP, Xdebug.
* <code>lamp-itk</code>          => Apache2 with MPM ITK, MySql, PHP, Xdebug.
* <code>libmp3lame</code>        => MP3 audio encoder.
* <code>oracle-java8</code>
* <code>oracle-java-6</code>     => Oracle Java 6
* <code>teamviewer-amd64</code>  => Teamviewer 8 64bit (Latest).
* <code>teamviewer7-amd64</code> => Teamviewer 7 64bit.
* <code>ubuntu-update</code>     => Update apt-get and upgrade applications.
* <code>virtualbox</code>        => Latest supported version of Oracle VirtualBox in Ubuntu.
* <code>webmin</code>
* <code>x264</code>              => H.264 video encoder.
* <code>yasm</code>              => Yasm is an assembler used by x264 and FFmpeg.

Helps:

SSH
===

ssh-copy-id -i ~/.ssh/id_rsa.pub remote-host

Locales
=======

locale-gen fr_BE.UTF-8
dpkg-reconfigure locales
