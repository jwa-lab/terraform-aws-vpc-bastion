#!/bin/bash -xe
yum update -y

export HOME=/root

########################################################################################################################
####  HA PROXY
########################################################################################################################
yum install -y haproxy

echo "
listen pgsql
        bind 0.0.0.0:5432
        timeout connect 10s
        mode tcp
        server pgsql ${db_address}
" >> /etc/haproxy/haproxy.cfg

service haproxy restart
