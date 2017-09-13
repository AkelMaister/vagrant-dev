#!/usr/bin/env bash

if [ ! -e /etc/vagrant/mongo ]; then
	echo ">>> setting up mongo"
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv BC711F9BA15703C6
	echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.4.list
	apt-get update
	apt-get install -y mongodb-org
	systemctl enable mongod
	touch /etc/vagrant/mongo
else
	echo ">>> mongo already setup..."
fi
