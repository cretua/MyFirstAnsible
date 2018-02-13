# -*- mode: ruby -*-
# vi: set ft=ruby :

# README
#
# Getting Started:
# 1. vagrant plugin install vagrant-hostmanager
# 2. vagrant up
# 3. vagrant ssh
#
# This should put you at the control host
#  with access, by name, to other vms
Vagrant.configure(2) do |config|

  config.hostmanager.enabled = true
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "ansible_code/", "/ansible_code", disabled: false
  
  config.vm.define "control_main", primary: true do |h|
	h.vm.network "private_network", ip: "192.168.135.12"
    
	h.vm.hostname = "controlmain"
	
	h.vm.provision "shell", path: "provisioners/install_tools.sh"
    h.vm.provision :shell, :inline => <<'EOF'
	
if [ ! -f "/home/vagrant/.ssh/id_rsa" ]; then
  ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
fi

cp /home/vagrant/.ssh/id_rsa.pub /vagrant/control.pub

cat << 'SSHEOF' > /home/vagrant/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
SSHEOF

chown -R vagrant:vagrant /home/vagrant/.ssh/

EOF
 end

   config.vm.define "my_webserver" do |h|
    h.vm.network "private_network", ip: "192.168.135.114"
    h.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
	h.vm.hostname = "mywebserver"
  end
 
end
