#!/bin/bash

cd /home/git/gitlab
sudo -u git -H RAILS_ENV=production bundle exec rake gitlab:backup:create

sudo service gitlab stop

cd /home/git/gitlab
sudo -u git -H git fetch
sudo -u git -H git checkout 6-1-stable

cd /home/git/gitlab-shell
sudo -u git -H git fetch
sudo -u git -H git checkout v1.7.1

cd /home/git/gitlab

# MySQL
sudo -u git -H bundle install --without development test postgres --deployment

sudo -u git -H bundle exec rake db:migrate RAILS_ENV=production
sudo -u git -H bundle exec rake migrate_iids RAILS_ENV=production
sudo -u git -H bundle exec rake assets:clean RAILS_ENV=production
sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production
sudo -u git -H bundle exec rake cache:clear RAILS_ENV=production

sudo rm /etc/init.d/gitlab
sudo curl --output /etc/init.d/gitlab https://raw.github.com/gitlabhq/gitlabhq/6-1-stable/lib/support/init.d/gitlab
sudo chmod +x /etc/init.d/gitlab

sudo service gitlab start
sudo service nginx restart

sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production

sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
