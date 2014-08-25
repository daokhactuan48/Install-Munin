printf "Ten may: -> "
read tenmay
printf "IP: -> "
read IP
echo "[$tenmay]" >> /etc/munin/munin.conf
echo -e  "    address $IP" >> /etc/munin/munin.conf
echo -e  "    use_node_name yes" >> /etc/munin/munin.conf
echo "---Restart Apache"
service apache2 restart
