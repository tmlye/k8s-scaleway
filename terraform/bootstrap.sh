#!/bin/bash
set -e

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc
gpg --verify rvm-installer.asc
bash rvm-installer stable

# Install Ruby and Chef
source /etc/profile.d/rvm.sh
rvm install ruby-2.4.1
gem install chef
gem install berkshelf
cd /tmp/chef
find cookbooks -name Berksfile -exec berks vendor cookbooks -b {} \;
chef-client --config config.rb -z -j $1
