#!/usr/bin/env bash

if [ ! -e /etc/vagrant/mongo ]; then
	echo ">>> setting up mongo"
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
	echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.5 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.5.list
	apt-get update
	apt-get install -y mongodb-org
	cat /vagrant/vagrant/templates/mongoinit > /etc/systemd/system/mongodb.service
	systemctl enable mongodb
	touch /etc/vagrant/mongo
else
	echo ">>> mongo already setup..."
fi
