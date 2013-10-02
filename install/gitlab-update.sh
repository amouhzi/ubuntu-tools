#!/bin/bash

cd /home/git/gitlab

echo "Do a backup:"
sudo -u git -H RAILS_ENV=production bundle exec rake gitlab:backup:create

read -p "Continue? Y/n" res
res=${res:-Y}

if test res ! = "Y"
then
  echo "Exit."
  exit
fi

echo "Stop the gitlab server:"
sudo service gitlab stop

read -p "Continue? Y/n" res
res=${res:-Y}

if test res ! = "Y"
then
  echo "Exit."
  exit
fi

sudo -u git -H git pull

sudo -u git -H bundle exec rake assets:clean RAILS_ENV=production
sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production
sudo -u git -H bundle exec rake cache:clear RAILS_ENV=production

sudo service gitlab start
sudo service nginx restart

sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production

sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
