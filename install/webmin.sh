echo "\n Webmin installation:"
echo "---------------------\n"

echo "GPG Key:"

wget -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add -

echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list

apt-get update

apt-get install -y webmin

service webmin start
