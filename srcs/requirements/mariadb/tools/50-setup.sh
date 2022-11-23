#!/bin/bash


# while 1; do;

# done;

# for i in $dir; do;

# done;

if [ ! -d "/var/lib/mysql/${DATABASE_NAME}" ]; then


#service mysql start
( service mysql start & ) | grep -q "active"
	echo "ACTIVE"

mysql -u root << EOF
CREATE DATABASE ${DATABASE_NAME};
CREATE USER '${DATABASE_USER_NAME}'@'localhost' identified by '${DATABASE_USER_PSW}';
EOF

# Sleep a little bit for mysql to proccess everything and then stop
sleep 3

(service mysql stop & ) | grep -q "inactive"
	echo "DEAD"

fi;
echo huhumama123

exec $@