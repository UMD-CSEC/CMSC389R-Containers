if [ "$1" = "" ]; then
	echo "Specify a port number to filter on.";
	exit 1;
fi


# appends pcaps to the clean_traffic file. 
for pcap in `ls logs/`; do tshark -r logs/$pcap --disable-protocol syslog -Y "tcp.port eq $1" -T fields -e data  | xxd -r -p >> clean_traffic.txt; done

