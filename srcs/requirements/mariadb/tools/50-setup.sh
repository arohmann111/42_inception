#!/bin/bash
if [ ! -d "/var/lib/mysql/${DATABASE_NAME}" ]; then

#service mysql start
( service mysql start & ) | grep -q "active"
	echo "ACTIVE"

mysql -u root << EOF
CREATE DATABASE ${DATABASE_NAME};
CREATE USER '${DATABASE_USER_NAME}'@'%' identified by '${DATABASE_USER_PASS}';
GRANT ALL PRIVILEGES ON *.* TO '${DATABASE_USER_NAME}'@'%'
EOF

# Sleep a little bit for mysql to proccess everything and then stop
sleep 3

(service mysql stop & ) | grep -q "inactive"
	echo "DEAD"

fi;

exec $@