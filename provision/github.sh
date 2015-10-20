#!/usr/bin/env bash

read -p "Enter your git user name: " git_name
read -p "Enter your git user email: " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"

echo -e '\n'
echo 'Generating ssh keys...'
mkdir ~/.ssh
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

echo -e '\n'
echo 'Add the following public key to your Github account (https://github.com/settings/ssh)'
echo -e '\n'
cat /home/vagrant/.ssh/id_rsa.pub
echo -e '\n'
read -p "Press Enter to continue."

echo 'Cloning repositories...'
mkdir /vagrant/repos
git clone git@github.com:okfn-brasil/gastos_abertos.git /vagrant/repos/gastos_abertos
git clone git@github.com:okfn-brasil/gastos_abertos_website.git /vagrant/repos/gastos_abertos_website
git clone git@github.com:okfn-brasil/gastos_abertos_dados.git /vagrant/repos/gastos_abertos_dados

ln -s /vagrant/repos/gastos_abertos ~/gastos_abertos
ln -s /vagrant/repos/gastos_abertos_website ~/gastos_abertos_website
ln -s /vagrant/repos/gastos_abertos_dados ~/gastos_abertos_dados
