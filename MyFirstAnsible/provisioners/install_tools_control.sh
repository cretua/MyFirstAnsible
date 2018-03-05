#!/bin/bash
sudo apt update

sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update

sudo apt-get install -y ansible

sudo cp /ansible_code/dev /etc/ansible/
sudo cp /ansible_code/ansible.cfg /etc/ansible/

sudo apt-get install -y openjdk-8-jre

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins