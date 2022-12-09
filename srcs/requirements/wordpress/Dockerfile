# FROM debian:buster

# RUN apt-get update
# RUN apt-get install -y curl php php-mysql mariadb-client php-fpm
# RUN apt-get install dumb-init -y
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# RUN mkdir -p /run/php/

# COPY ./tools/setup.sh /usr/local/bin/setup.sh
# RUN chmod +x /usr/local/bin/setup.sh

# ARG WP_ROOT_DIR="/var/www/wordpress"
# ENV WP_ROOT_DIR=${WP_ROOT_DIR}
# # Create Wordpress site's document Root Directory
# RUN mkdir -p ${WP_ROOT_DIR}
# # Change owner to www-data
# RUN chown -R www-data:www-data ${WP_ROOT_DIR}
# # Change user and group to www-data
# RUN chown www-data:www-data ${WP_ROOT_DIR}
# # Copy Wordpress Config to Container
# RUN rm -rf /var/www/wordpress/wp-config.php
# COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php

# COPY ./conf/default.conf /etc/php/7.3/fpm/pool.d

# EXPOSE 9000

# ENTRYPOINT [ "bash", "-c" ,"setup.sh" ]

FROM debian:buster

# install php
RUN apt-get update -y && apt-get upgrade
RUN apt-get install -y php
RUN apt-get install -y php-mysql
RUN apt-get install -y tar
RUN apt-get install -y php-fpm
RUN apt-get install -y wget

# install wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv -f wordpress /var/www/
RUN chown -R www-data:www-data /var/www/wordpress

#config wordpress
RUN rm -rf /var/www/wordpress/wp-config.php
COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php
COPY ./conf/default.conf /etc/php/7.3/fpm/pool.d
RUN mkdir -p /run/php/

EXPOSE 9000

ENTRYPOINT ["php-fpm7.3", "-F"]