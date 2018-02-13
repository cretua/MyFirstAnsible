#!/bin/bash
sudo apt update

sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update

sudo apt-get install -y ansible

sudo cp /ansible_code/dev /etc/ansible/
sudo cp /ansible_code/ansible.cfg /etc/ansible/
#sudo cp /ansible_code/hosts /etc/ansible/