FROM i386/ubuntu

RUN apt update -y 
RUN apt install -y libstdc++5 libx11-6 kmod envsubst
ADD snx /opt/snx
