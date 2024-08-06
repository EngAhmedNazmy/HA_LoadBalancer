FROM debian:latest
MAINTAINER Ahmed-Nazmy

ENV KP_STATE_1=MASTER
ENV KP_PRIORITY_1=100
ENV VRRP_INSTANCE_1=VI_22
ENV VIRTUAL_ROUTER_ID_1=202
ENV VIRTUAL_IPADDRESS_1=172.17.0.43
ENV KP_STATE_2=BACKUP
ENV KP_PRIORITY_1=80
ENV VRRP_INSTANCE_2=VI_23
ENV VIRTUAL_ROUTER_ID_2=203
ENV VIRTUAL_IPADDRESS_2=172.17.0.44

RUN apt-get update
RUN apt-get install -y nano keepalived nginx procps
ADD ./keepalived.conf /etc/keepalived/keepalived.conf
ADD ./updateconf.sh /etc/keepalived/updateconf.sh
ADD ./master.sh /etc/keepalived/master.sh
ADD ./backup.sh /etc/keepalived/backup.sh
ADD ./master2.sh /etc/keepalived/master2.sh
ADD ./backup2.sh /etc/keepalived/backup2.sh
WORKDIR /etc/keepalived
RUN chmod +x backup2.sh master2.sh backup.sh master.sh updateconf.sh
RUN useradd -r nginx
ENTRYPOINT ["/bin/bash","./updateconf.sh"]

