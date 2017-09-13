#!/usr/bin/env bash

if [ ! -e /etc/vagrant/apt-get ]; then
	echo ">>> setting up apt-get"
	apt-get update
	apt-get -y upgrade
	apt-get install -y software-properties-common build-essential
	touch /etc/vagrant/apt-get
else
	echo ">>> apt-get is already setup..."
fi
