#!/usr/bin/env bash
echo 'Installing Oracle Java...'

add-apt-repository -y ppa:webupd8team/java

apt-get -y update

echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

apt-get install -y oracle-java7-installer
