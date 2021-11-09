#!/bin/sh

sudo apt update -y
sudo apt install -y ansible sshpass

sudo mkdir -p /home/docker/.ansible
sudo chown docker.docker -R /home/docker

sudo cp files/ansible.cfg /etc/ansible/ansible.cfg

#master ip
ip4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
ip6=$(/sbin/ip -o -6 addr list eth0 | awk '{print $4}' | cut -d/ -f1)

#workers ip
echo "[service]" > /project/courses/Thesis/inventory.yml
# /project/bin/swarmlab-nmap >> /project/courses/Thesis/inventory.yml


# include master or not
echo $ip4 >> /project/courses/Thesis/inventory.yml

#dummy DONE
# ansible-playbook -u docker -i inventory.yml node.yml  -f 5  --ask-pass --ask-become-pass

#mongo
ansible-playbook -u docker -i inventory.yml mongo.yml  -f 5  --ask-pass --ask-become-pass

# 1st make sudo without password
# run with keys
#ansible-playbook -u docker -i inventory.yml fluentd.yml  -f 5  --private-key=/home/docker/.ssh/id_rsa

#get workers ip
#nmap -sn -oG - $ip/24 | grep Up | grep $NODENETWORK | cut -d ' ' -f 2