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
    tcpdump -i eth0 port not 22 -w logs/cap_$now.pcap &
    ncat -l -p $1 -k -e login.sh

	# just gonna test something
    # tcpserver 157.230.191.49 $1 ./container_startup.sh 2> logs/log_$now.txt
    # Close port
    iptables -I INPUT 1 -p tcp --dport $1 -j DROP
fi

