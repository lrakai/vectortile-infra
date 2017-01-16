#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook ansible/site.yml

export ANSIBLE_HOST_KEY_CHECKING=True