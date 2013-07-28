#!/bin/bash

# From 5.3 to 5.4

cd /home/git/gitlab

# Backup
sudo -u git -H RAILS_ENV=production bundle exec rake gitlab:backup:create

# Stop server
sudo service gitlab stop

# Get latest code
sudo -u git -H git fetch
sudo -u git -H git checkout -f 5-4-stable

# Install libs, migrations, etc : MySQL
sudo -u git -H bundle install --without development test postgres --deployment
sudo -u git -H bundle exec rake db:migrate RAILS_ENV=production
sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production

# Start application
sudo service gitlab start
sudo service nginx restart

# Check application status
sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production
sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
