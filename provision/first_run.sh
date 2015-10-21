#!/usr/bin/env bash

/vagrant/provision/github.sh
/vagrant/provision/apps.sh

sed -i '/.*first_run.sh/d' ~/.bashrc

cd ~ && ls

/vagrant/autorun.sh
