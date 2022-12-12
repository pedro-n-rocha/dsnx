FROM i386/ubuntu

RUN apt update -y 
RUN apt install -y libstdc++5 libx11-6 kmod gettext-base iptables
ADD snx /usr/sbin
ADD snxrc.tmpl /root/snxrc.tmpl
ADD root.db /etc/snx/
ADD USER.db /etc/snx/

ADD iptables.rules /etc/iptables.rules

CMD ["/bin/sh", "-c", "envsubst < /root/snxrc.tmpl >/root/.snxrc && bash"]
