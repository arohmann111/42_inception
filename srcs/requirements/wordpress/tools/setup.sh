#!/bin/bash

set -ex

echo "core download"
wp core download --allow-root

echo "config create"
wp --allow-root config create \
		--dbhost=${DATABASE_HOST} \
		--dbname=${DATABASE_NAME} \
		--dbuser=${DATABASE_USER_NAME} \
		--dbpass=${DATABASE_USER_PASS}

# wp core config --dbname=${DATABASE_NAME} \
# 			--dbuser=${DATABASE_USER} \
# 			--dbpass=${DATABASE_PASSW} \
# 			--allow-root

echo "core install"
wp core install --url=${WP_URL} \
				--title=${WP_URL} \
				--admin_user=${WP_ADMIN} \
				--admin_password=${WP_ADMIN_PASS} \
				--admin_email=${WP_ADMIN_EMAIL} \
				--allow-root

echo "user create"
wp user create ${WP_USER} "${WP_USER_EMAIL}" --user_pass=${WP_USER_PASS} --role=author --allow-root

echo "php-fpm"
php-fpm7.3 -F
