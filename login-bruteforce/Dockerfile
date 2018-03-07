FROM ubuntu 
MAINTAINER michael@csec.umiacs.umd.edu

RUN apt update && apt install -y iproute2 netcat gawk
ADD container_startup.sh /opt/container_startup.sh
ADD flag.txt /home/flag.txt
RUN chmod +x /opt/container_startup.sh

ENTRYPOINT ["/opt/container_startup.sh"]
