#!/bin/bash -xe
yum update -y

export HOME=/root

########################################################################################################################
####  HA PROXY
########################################################################################################################
yum install -y haproxy

echo "
listen database
        bind 0.0.0.0:${db_port}
        timeout connect 10s
        mode tcp
        server database ${db_address}
" >> /etc/haproxy/haproxy.cfg

service haproxy restart
