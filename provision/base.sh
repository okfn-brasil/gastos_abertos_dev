#!/usr/bin/env bash
echo 'Configuring base system...'

apt-get -y update && apt-get -y upgrade

apt-get install --reinstall -y language-pack-en language-pack-pt
apt-get install -y curl wget ca-certificates tmux vim fontconfig build-essential libtool checkinstall libxml2-dev

chmod 755 /home/vagrant

echo '/vagrant/provision/first_run.sh' >> /home/vagrant/.bashrc
