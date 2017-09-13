#!/usr/bin/env bash

if [ ! -e /etc/vagrant/redis ]; then
	echo ">>> setting up redis"
	apt-get update
	apt-get -y install redis-server
	echo "maxmemory 128mb
maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
	systemctl enable redis-server.service
	touch /etc/vagrant/redis
else
	echo ">>> redis already setup..."
fi
