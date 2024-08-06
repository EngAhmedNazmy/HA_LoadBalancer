#!/bin/bash
dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt BACKUP for First VIP " >> keepalived_info.txt
exec -a "nginx1" /usr/bin/nginx -t -c ~/nginx1.conf -g "pid /var/run/nginx.pid; worker_processes 2;"
exec /usr/sbin/nginx -c /etc/nginx/nginx1.conf

