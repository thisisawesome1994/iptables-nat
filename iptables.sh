echo 1 >> /proc/sys/net/ipv4/ip_forward
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eno1 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADE
iptables -A FORWARD -i ens4 -o eno1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eno1 -o ens4 -j ACCEPT
