#!/usr/bin/env bash
echo 'Installing Node.js...'

wget --quiet -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

echo "deb https://deb.nodesource.com/node_0.12 $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/node_0.12 $(lsb_release -cs) main" >> /etc/apt/sources.list.d/nodesource.list

apt-get -y update
apt-get install -y nodejs
