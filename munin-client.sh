#!/bin/bash 
# Shell cai dat munin cho cac node (cac client)

echo "Bat dau cai dat munin tren cac may client"
sudo apt-get update
sudo apt-get -y install munin-node munin-plugins-extra

echo "Da cai xong MUNIN"

echo "Bat dau chinh sua file /etc/munin/munin-node.conf"
sleep 5

filemunin=/etc/munin/munin-node.conf
test -f $filemunin.orig || cp $filemunin $filemunin.orig
# rm $filemunin
# touch $filemunin
sed -i 's/allow ^127.*/allow ^172\\.16\\.69\\.15$/g' /etc/munin/munin-node.conf
echo "Khoi dong lai munin"
sleep 5
sudo restart munin-node
