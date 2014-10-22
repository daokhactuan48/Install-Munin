#! /bin/bash

echo "--Cai dat va cau hinh Master-----------------------------"
apt-get update

echo "--Cai dat apache-----------------------------------------"

apt-get install apache2 -y

echo "--Cai dat Munin Master-----------------------------------"

apt-get install munin -y

echo "---------------------------------------------------------"

echo "----------Configure--------------------"

filemunin=/etc/munin/munin.conf
fileapache=/etc/munin/apache.conf
#Kiem tra xem co file backup chua. Neu chua thi tien hanh tao file backup
test -f $filemunin.bka || cp $filemunin $filemunin.bka
test -f $fileapache.bka || cp $fileapache $fileapache.bka
rm $filemunin
rm $fileapache

cat << EOF >>$filemunin
dbdir /var/lib/munin
htmldir /var/www/munin
logdir /var/log/munin
rundir  /var/run/munin
tmpldir /etc/munin/templates
includedir /etc/munin/munin-conf.d
[Muninnode]
    address 127.0.0.1
    use_node_name yes
EOF

cat << EOF >>$fileapache
Alias /munin /var/www/munin
<Directory /var/munin/www>
        Order allow,deny
        Allow from all
        Options None

    <IfModule mod_expires.c>
        ExpiresActive On
        ExpiresDefault M310
    </IfModule>
</Directory>
EOF

echo "--Tien hanh tao thu muc------------------------------"

mkdir /var/www/munin
chown munin:munin /var/www/munin

echo "--Khoi dong lai dich vu------------------------------"
service munin-node restart
sudo service apache2 restart

echo "--Hoan thanh qua trinh cai dat munin Master----------"


