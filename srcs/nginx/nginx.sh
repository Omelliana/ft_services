#!/bin/sh
# generate the host keys with the default key file path
ssh-keygen -A

# add user
adduser -D admin
echo "admin:admin" | chpasswd

# start server ssh
/usr/sbin/sshd

# make directory for running nginx
mkdir -p /var/run/nginx

# run server
nginx -g "daemon off;"