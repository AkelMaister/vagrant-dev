#!/usr/bin/env bash

if [ ! -e /etc/vagrant/nginx ]; then
	echo ">>> setting up nginx"
	apt-get install -y nginx
	cat /vagrant/templates/nginx-site-conf > /etc/nginx/sites-available/default
	service nginx restart
	touch /etc/vagrant/nginx
else
	echo ">>> nginx already setup..."
fi
