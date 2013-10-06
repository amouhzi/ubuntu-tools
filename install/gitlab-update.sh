#!/bin/bash

ask() {
    read -p "$1" REPLY
    if test $REPLY = "y"
    then
            return 1;
    else
            echo "Abort.."
            exit
    fi
}

cd /home/git/gitlab

# BACKUP
read -p "Need a backup? [y/N] " REPLY
if test $REPLY = "y"
then
    echo "Doing a backup, please wait ... "
    sudo -u git -H RAILS_ENV=production bundle exec rake gitlab:backup:create
fi

ask "Continue? [y/N] "

echo "Get latest code"
sudo -u git -H git pull

read -p "Need to recompile assets? [y/N] " REPLY
if test $REPLY = "y"
then
    sudo -u git -H bundle exec rake assets:clean RAILS_ENV=production
    sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production
    sudo -u git -H bundle exec rake cache:clear RAILS_ENV=production
fi

echo "Restart gitlab server .. "
sudo service gitlab restart

read -p "Getting environment informations? [y/N] " REPLY
if test $REPLY = "y"
then
    echo "Getting environment informations, please wait .. "
    sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production
fi

read -p "Need to check the environment? [y/N] " REPLY
if test $REPLY = "y"
then
    sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
fi

echo "Finish! "
