#!/usr/bin/env bash

sudo apt-get update

# utilities
sudo apt-get install -y curl make vim

# install apache
apt-get update -y
apt-get install -y apache2
sudo a2enmod rewrite
sudo service apache2 restart

# install php5
sudo apt-get install -y php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-cli php5-xdebug

# install mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-server-5.5 php5-mysql

# post tasks
# enable xdebug
cat << EOF | sudo tee -a /etc/php5/conf.d/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

# install composer
curl -sS https://getcomposer.org/installer
sudo mv composer.phar /usr/local/bin/composer

# restart apache
sudo service apache2 restart
