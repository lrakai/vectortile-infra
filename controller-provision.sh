#!/usr/bin/env bash

# install ansible and necessary packages
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt-get install -y ansible sshpass

# move inventory out of shared directory (full permissions on Windows causing ansible to interpret it as a dyanmic file) 
cp -R /vagrant/ansible/. /home/vagrant/
sudo chown -R vagrant:vagrant /home/vagrant/  

# Initialize site
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook /home/vagrant/ansible/site.yml
export ANSIBLE_HOST_KEY_CHECKING=True

# Seed data
./home/vagrant/seed-data.sh