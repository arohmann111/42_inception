#!/bin/bash
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then

#service mysql start
( service mysql start & ) | grep -q "active"
	echo "ACTIVE"

sleep 3

# create admin of database
mysql -u root << EOF
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER}'@'%' identified by '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# Sleep a little bit for mysql to proccess everything and then stop
sleep 3

(service mysql stop & ) | grep -q "inactive"
	echo "DEAD"

fi

exec $@