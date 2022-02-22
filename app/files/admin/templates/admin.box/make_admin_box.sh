#!/bin/bash

# Install some packages
yum install -y epel-release
yum install -y git-all
yum install -y wget
yum install -y vim
yum install -y xauth*
yum install -y unzip


# SSH - install private key, copies from the default /vagrant rsync share
mv /vagrant/workspace/keys/your_private_ssh_key_here /home/vagrant/.ssh/
mv /vagrant/workspace/keys/known_hosts /home/vagrant/.ssh/
chmod 0600 /home/vagrant/.ssh/your_private_ssh_key_here

# setup Banner
echo "##########################################" >> /etc/motd
echo "#  Welcome to Nepalese in Tech Admin Box #" >> /etc/motd
echo "##########################################" >> /etc/motd

# edit sshd_config to allow root login
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# restart sshd service
service sshd restart 

# make dir for working today 
echo 'alias ok="cd /vagrant/workspace/aja/"' >> /home/vagrant/.bash_profile
source /home/vagrant/.bash_profile

echo "admin box setup is complete."