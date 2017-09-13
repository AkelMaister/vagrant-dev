#!/usr/bin/env bash

if [ ! -e /etc/vagrant/solr ]; then
	echo ">>> setting up solr"
	add-apt-repository ppa:webupd8team/java
	apt-get update
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
	DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer

	solrversion=$(curl -s http://apache.cp.if.ua/lucene/solr/ | grep "\[DIR\]" 2>/dev/null | awk -F '"' '{print $6}' | sort -nr | head -1 | sed 's|/||g')
	wget http://www.us.apache.org/dist/lucene/solr/${solrversion}/solr-${solrversion}.tgz
	tar xzf solr-${solrversion}.tgz solr-${solrversion}/bin/install_solr_service.sh --strip-components=2
	sudo ./install_solr_service.sh solr-${solrversion}.tgz
        rm -f solr-${solrversion}.tgz
        rm -f ./install_solr_service.sh
	touch /etc/vagrant/solr
else
	echo ">>> solr already setup..."
fi
