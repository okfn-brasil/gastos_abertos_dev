#!/usr/bin/env bash

/vagrant/provision/github.sh

sed -i '/.*first_run.sh/d' ~/.bashrc

cd ~ && ls
