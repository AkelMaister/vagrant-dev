#!/usr/bin/env bash

if [ ! -e /etc/vagrant/php ]; then
	echo ">>> setting up php"
	add-apt-repository ppa:ondrej/php
	apt-get update
	apt-get install -y php7.1-gd php7.1-dom php7.1-fpm php7.1-gmp php7.1-xsl php7.1-xml php7.1-zip php7.1-intl php7.1-curl php7.1-pgsql php7.1-redis php7.1-bcmath php7.1-mcrypt php7.1-mbstring php7.1-pdo-pgsql composer
	sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.1/fpm/php.ini
	cat /vagrant/vagrant/templates/php-fpm-pool.conf > /etc/php/7.1/fpm/pool.d/www.conf
	touch /etc/vagrant/php
else
	echo ">>> php already setup..."
fi