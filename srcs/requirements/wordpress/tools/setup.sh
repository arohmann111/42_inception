#!/bin/bash

set -ex

sleep 3;

echo "core download"
wp core download --path=${WP_ROOT_DIR} --allow-root || true

# echo "config create"
# wp --allow-root config create \
# 		--dbhost=${DATABASE_HOST} \
# 		--dbname=${DATABASE_NAME} \
# 		--dbuser=${DATABASE_USER_NAME} \
# 		--dbpass=${DATABASE_USER_PASS}

# wp core config --dbname=${DATABASE_NAME} \
# 			--dbuser=${DATABASE_USER} \
# 			--dbpass=${DATABASE_PASSW} \
# 			--allow-root

if ! wp --allow-root --path=${WP_ROOT_DIR} core is-installed;
	then
	echo "core install"
	wp core install --path=${WP_ROOT_DIR} --url=${WP_URL} \
					--title=${WP_URL} \
					--admin_user=${WP_ADMIN} \
					--admin_password=${WP_ADMIN_PASS} \
					--admin_email=${WP_ADMIN_EMAIL} \
					--allow-root
fi;

echo "user create"
wp user create --path=${WP_ROOT_DIR} ${WP_USER} "${WP_USER_EMAIL}" --user_pass=${WP_USER_PASS} --role=author --allow-root

echo "php-fpm"
php-fpm7.3 -F
