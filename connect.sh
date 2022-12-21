#!/usr/bin/env expect

set username $USERNAME
set pass [lindex $argv 0]
set host $VPNSERVER

spawn snx -s ${host} -u ${username}
expect "Please enter your password:" { send "${pass}\r" }
interact

