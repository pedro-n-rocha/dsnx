snx dockerized

vpnrc envsubsted  ( deprecated ) 

revise arch and launch snx with Z option, implement script to login through port 7776

https://github.com/schlatterbeck/snxvpn/blob/master/snxconnect.py

root@5f1e0fadf081:/# netstat  -anp 
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.1:7776          0.0.0.0:*               LISTEN      13/snx              
tcp        0      0 127.0.0.11:46791        0.0.0.0:*               LISTEN      -                   
udp        0      0 127.0.0.11:43281        0.0.0.0:*                           -                   
Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node   PID/Program name     Path


iptables rules 

iptables -t nat -A POSTROUTING -o tunsnx -j MASQUERADE
iptables -A FORWARD -i tunsnx -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -o tunsnx -j ACCEPT
