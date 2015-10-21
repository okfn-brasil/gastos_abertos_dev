#!/usr/bin/env bash

while true; do
    read -p "Do you want to start the servers? [Y\n] " yn
    yn=${yn:-y}
    case $yn in
        [Yy]* ) tmux start-server \; source-file /vagrant/config/autorun.tmux; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
    esac
done
