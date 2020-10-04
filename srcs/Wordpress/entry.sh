#!/bin/sh

mysql --host=mysql-service --user=admin --password=admin wordpress < /tmp/wordpress.sql

# Start server
php -S 0.0.0.0:5050 -t /etc/wordpress/