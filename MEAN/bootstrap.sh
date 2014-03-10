#!/usr/bin/env bash

sudo apt-get update

# utilities
sudo apt-get install -y g++ libssl-dev
sudo apt-get install -y curl make vim

# install git-core
sudo apt-get install -y git-core

# install node
git clone git://github.com/joyent/node.git
cd node
./configure
make
sudo make install

# install nvm - (https://github.com/creationix/nvm)
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# install mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update -y
sudo apt-get install -y mongodb-10gen

# install express
sudo npm install -g express

# install grunt
sudo npm install -g grunt
sudo npm install -g grunt-cli

# install bower
sudo npm install -g bower

# install mean.io
git clone https://github.com/linnovate/mean.git
cd mean
sudo npm install
grunt
