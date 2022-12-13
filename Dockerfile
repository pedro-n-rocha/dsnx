FROM i386/ubuntu

RUN apt update -y 
RUN apt install -y libstdc++5 libx11-6 kmod gettext-base iptables net-tools iputils-ping iproute2
ADD snx /usr/sbin
ADD snxrc.tmpl /root/snxrc.tmpl
ADD root.db /etc/snx/
ADD USER.db /etc/snx/
