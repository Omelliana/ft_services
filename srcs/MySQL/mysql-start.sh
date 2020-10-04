#!/bin/sh

# Creates an administrative account 'root'@'localhost'
/usr/bin/mysql_install_db --user=root

# make temporary file name
tmpfile=`mktemp`

# write sql query
cat > $tmpfile << EOF
FLUSH PRIVILEGES;
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# --user		Run the mysqld server as the user having the name user_name
# --bootstrap	Create the MySQL privilege tables without having 
#				to start a full MySQL server.
# --verbose		show progres; verbose=0 show nothing(silent)	

/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tmpfile
rm -f $tmpfile

# Start MySQL server
/usr/bin/mysqld --user=root --console