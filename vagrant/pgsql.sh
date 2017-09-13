#!/usr/bin/env bash

if [ ! -e /etc/vagrant/pgsql ]; then
	echo ">>> setting up pgsql"
	add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
	apt-get update
	apt-get -y install postgresql-9.6
	touch /etc/vagrant/pgsql
else
	echo ">>> pgsql already setup..."
fi
