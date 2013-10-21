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

read -p "Do you want to do a backup? [y/N] " REPLY
if test $REPLY = "y"
then
    echo "please wait ... "
    sudo -u git -H RAILS_ENV=production bundle exec rake gitlab:backup:create
fi

echo "Commit your changes:"
sudo -u git -H git commit -m "My changes"

echo "Get latest code"

sudo -u git -H git fetch
sudo -u git -H git checkout 6-2-stable

echo "Add support for lograte for better log file handling"
sudo apt-get install logrotate

echo "If you are using a relative url, you need to update application.rb"
read -p "Do you want to update it? [y/N] " REPLY
if test $REPLY = "y"
then
  echo "To start editing file push on i"
  echo "To quit and save changes, push on ESC, then :wq"
  sudo -u git -H vim config/application.rb
fi

#echo "Update gitlab-shell"

#cd /home/git/gitlab-shell
#sudo -u git -H git fetch
#sudo -u git -H git checkout v1.7.1

cd /home/git/gitlab

read -p "MySQL or PostgreSQL? [mysql/postgres] " REPLY

if test $REPLY = "mysql"
then
  sudo -u git -H bundle install --without development test postgres --deployment
else
  if test $REPLY = "postgres"
  then
    sudo -u git -H bundle install --without development test mysql --deployment
  else
    echo "Sorry, restart."
    exit
  fi
fi

echo "Migrate database"
sudo -u git -H bundle exec rake db:migrate RAILS_ENV=production

#echo "Migrate iids"
#sudo -u git -H bundle exec rake migrate_iids RAILS_ENV=production

read -p "Need to recompile assets? [y/N] " REPLY

if test $REPLY = "y"
then

    sudo -u git -H bundle exec rake assets:clean RAILS_ENV=production
    sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production
    sudo -u git -H bundle exec rake cache:clear RAILS_ENV=production
    
fi

echo "What changed in gitlab.yml.example in this release:"
git diff 6-1-stable:config/gitlab.yml.example 6-2-stable:config/gitlab.yml.example

read -p "Do you need to update gitlab.yml? [y/N] " REPLY

if test $REPLY = "y"
then
  echo "To start editing file push on i"
  echo "To quit and save changes, push on ESC, then :wq"
  sudo -u git -H vim config/gitlab.yml
fi

read -p "Do you need to update unicorn.rb? [y/N] " REPLY

if test $REPLY = "y"
then
  echo "To start editing file push on i"
  echo "To quit and save changes, push on ESC, then :wq"
  sudo -u git -H vim config/unicorn.rb
fi

echo "Copy rack attack middleware config"
sudo -u git -H cp config/initializers/rack_attack.rb.example config/initializers/rack_attack.rb

echo "Uncomment config.middleware.use Rack::Attack in application.rb"
echo "To start editing file push on i"
echo "To quit and save changes, push on ESC, then :wq"
sudo -u git -H vim config/application.rb

echo "Set up logrotate"
sudo cp lib/support/logrotate/gitlab /etc/logrotate.d/gitlab

echo "Update Init script"
sudo rm /etc/init.d/gitlab
sudo curl --output /etc/init.d/gitlab https://raw.github.com/gitlabhq/gitlabhq/6-2-stable/lib/support/init.d/gitlab
sudo chmod +x /etc/init.d/gitlab

echo "Restart gitlab server .. "

sudo service gitlab restart

#echo "Restart nginx .. "

#sudo service nginx restart

echo "Getting environment informations, please wait .. "

sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production

read -p "Need to check the environment? [y/N] " REPLY

if test $REPLY = "y"
then
    sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
fi

echo "Finish! "
