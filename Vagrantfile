# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--memory", 2024]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Ubunut 12.04 64bits (using the same OLD version used in production :\ )
  config.vm.box = "ubuntu/precise64"

  # Base
  config.vm.provision :shell, :path => "provision/base.sh"

  # Git
  config.vm.provision :shell, :path => "provision/git.sh"

  # Python
  config.vm.provision :shell, :path => "provision/python.sh"

  # Java
  config.vm.provision :shell, :path => "provision/java.sh"

  # Node.js
  config.vm.provision :shell, :path => "provision/nodejs.sh"

  # ElasticSearch
  config.vm.provision :shell, :path => "provision/elasticsearch.sh"

  # Postgres
  config.vm.provision :shell, :path => "provision/postgres.sh"

  # Apps
  config.vm.network :forwarded_port, guest: 5000, host: 5000 # API
  config.vm.network :forwarded_port, guest: 8000, host: 8000 # Frontend

  # ElasticSearch
  config.vm.network :forwarded_port, guest: 9200, host: 9200

  # IPython
  config.vm.network :forwarded_port, guest: 8888, host: 8888

  # Postgres
  # config.vm.network :forwarded_port, guest: 5432, host: 5432

end
