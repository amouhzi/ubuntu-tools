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

echo "Doing a backup, please wait ... "
sudo -u git -H RAILS_ENV=production bundle exec rake gitlab:backup:create

ask "Continue? [y/N] "

echo "Stop the gitlab server:"
sudo service gitlab stop

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

echo "Start gitlab server .. "

sudo service gitlab start

echo "Restart nginx .. "

sudo service nginx restart

echo "Getting environment informations, please wait .. "

sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production

read -p "Need to check the environment? [y/N] " REPLY

if test $REPLY = "y"
then
    sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
fi

echo "Finish! "
