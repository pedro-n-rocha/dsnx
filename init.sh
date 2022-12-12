echo $PASSWORD | snx
iptables -t nat -A POSTROUTING -o tunsnx -j MASQUERADE
iptables -A FORWARD -i tunsnx -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -o tunsnx -j ACCEPT
tail -f /dev/null
