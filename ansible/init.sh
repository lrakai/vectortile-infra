#!/usr/bin/env bash

# Initialize site
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook /home/vagrant/ansible/site.yml
export ANSIBLE_HOST_KEY_CHECKING=True

# Seed data
./home/vagrant/seed-data.sh