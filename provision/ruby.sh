#!/usr/bin/env bash
echo 'Installing Ruby dependecies...'

apt-get install -y zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

CWD="$(pwd)"

cd /tmp
wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz

tar -xvzf ruby-2.2.3.tar.gz
cd ruby-2.2.3/

./configure --prefix=/usr/local
make
make install

cd $CWD

gem install jekyll
