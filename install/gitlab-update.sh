#!/bin/bash

ask() {
    read -p "$1" -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
            return 1;
    else
            exit
            echo "Abort.."
    fi
}

cd /home/git/gitlab

echo "Doing a backup, please wait ... "
sudo -u git -H RAILS_ENV=production bundle exec rake gitlab:backup:create

ask "Continue? [y/N] "

echo "Stop the gitlab server:"
sudo service gitlab stop

ask "Continue? [y/N] "

sudo -u git -H git pull

sudo -u git -H bundle exec rake assets:clean RAILS_ENV=production
sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production
sudo -u git -H bundle exec rake cache:clear RAILS_ENV=production

sudo service gitlab start
sudo service nginx restart

sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production

sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
