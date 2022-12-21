FROM i386/ubuntu

RUN apt-get update -y && apt-get install -y libstdc++5 libx11-6 kmod iptables net-tools iputils-ping iproute2
ADD snx /usr/sbin
ADD root.db /etc/snx/
