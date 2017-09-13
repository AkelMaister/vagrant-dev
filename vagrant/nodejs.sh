#!/usr/bin/env bash

if [ ! -e /etc/vagrant/nodejs ]; then
	echo ">>> setting up nodejs"
	curl -sL https://deb.nodesource.com/setup_8.x | bash -
	apt-get install -y build-essential nodejs
	touch /etc/vagrant/nodejs
else
	echo ">>> nodejs already setup..."
fi
