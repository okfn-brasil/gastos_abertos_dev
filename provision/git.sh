#!/usr/bin/env bash
echo 'Installing and configuring GIT...'

apt-get install -y git

git config --global color.ui true
git config --global core.editor vim
