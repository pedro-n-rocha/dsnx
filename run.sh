#/bin/sh
docker run --cap-add=ALL -v /lib/modules:/lib/modules -e SERVER=$1 -e USERNAME=$2 -e PASSWORD=$3 --net qnet-dhcp-bond0-6d6da6 --mac-address 02:42:35:42:92:81 -it dsnx
