FROM debian:buster

RUN apt-get update
RUN apt-get install -y curl php php-mysql mariadb-client php-fpm
# get wordpress command line interface
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

ARG WP_ROOT_DIR="/var/www/wordpress"
ENV WP_ROOT_DIR=${WP_ROOT_DIR}
# Create Wordpress site's document Root Directory
RUN mkdir -p ${WP_ROOT_DIR}
# Change owner to www-data
RUN chown -R www-data:www-data ${WP_ROOT_DIR}
# Change user and group to www-data
RUN chown www-data:www-data ${WP_ROOT_DIR}

# download wordpress core
ADD https://wordpress.org/latest.tar.gz /tmp
RUN tar -xzvf /tmp/latest.tar.gz -C /var/www

RUN mkdir -p /run/php/

# run script
COPY ./tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

COPY ./conf/default.conf /etc/php/7.3/fpm/pool.d/www.conf

# expose port
EXPOSE 9000

ENTRYPOINT [ "bash", "-c" ,"setup.sh" ]