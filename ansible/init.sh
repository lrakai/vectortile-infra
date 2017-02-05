#!/usr/bin/env bash

# Initialize site
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook /home/vagrant/ansible/site.yml
export ANSIBLE_HOST_KEY_CHECKING=True

# Seed db data
/home/vagrant/seed-data.sh

#Seed monitor visualization
/home/vagrant/seed-visualization.sh