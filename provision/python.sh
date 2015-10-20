#!/usr/bin/env bash
echo 'Installing Python dependecies...'

apt-get install -y libxml2-dev libxslt1-dev python-dev

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

pip install virtualenvwrapper

cat <<EOF >>/home/vagrant/.bashrc

export WORKON_HOME=/home/vagrant/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

EOF
