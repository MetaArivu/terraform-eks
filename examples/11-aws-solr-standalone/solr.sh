#!/bin/bash -v

# Update list packages and install java
sudo apt-get update -y
sudo apt-get install openjdk-11-jdk
java -version


# download  solr
cd /opt
wget https://downloads.apache.org/lucene/solr/8.9.0/solr-8.9.0.tgz


# install tgz

tar xzf solr-8.9.0.tgz solr-8.9.0/bin/install_solr_service.sh --strip-components=2
sudo bash ./install_solr_service.sh solr-8.9.0.tgz


#start svc

sudo service solr stop
sudo service solr start
sudo service solr status
