printf "Ten may: -> "
read hostname
printf "IP: -> "
read IP
echo "[$hostname]" >> /etc/munin/munin.conf
echo -e  "\taddress $IP" >> /etc/munin/munin.conf
echo -e  "\tuse_node_name yes" >> /etc/munin/munin.conf
