#!/bin/bash
cp keepalived.conf keepalived.back
sed -i "s/STATE_1/$KP_STATE_1/g" /etc/keepalived/keepalived.conf
sed -i "s/STATE_2/$KP_STATE_2/g" /etc/keepalived/keepalived.conf
sed -i "s/PRIORITY_1/$KP_PRIORITY_1/g" /etc/keepalived/keepalived.conf
sed -i "s/PRIORITY_2/$KP_PRIORITY_2/g" /etc/keepalived/keepalived.conf
sed -i "s/VRI_1/$VIRTUAL_ROUTER_ID_1/g" /etc/keepalived/keepalived.conf
sed -i "s/VRI_2/$VIRTUAL_ROUTER_ID_2/g" /etc/keepalived/keepalived.conf
sed -i "s@VIP_1@$VIRTUAL_IPADDRESS_1@g" /etc/keepalived/keepalived.conf
sed -i "s@VIP_2@$VIRTUAL_IPADDRESS_2@g" /etc/keepalived/keepalived.conf

exec /usr/sbin/keepalived --dont-fork --log-console --log-detail

