#!/bin/bash

# Check if sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Check if passed port
if [ "$1" = "" ]; then
    echo "Usage: ./startenv.sh <port>"
else
    # Expose port
    iptables -I INPUT 1 -p tcp --dport $1 -j ACCEPT

    # Startup ncat listener
    now=$(date +%s)
    tcpdump -i eno2 port not 22 -w logs/cap_$now.pcap &
    ncat -l -p $1 -k -e startenv.sh 2> logs/log_$now.txt

    # Close port
    iptables -I INPUT 1 -p tcp --dport $1 -j DENY
fi

