FROM debian:buster

RUN apt-get update
RUN apt-get install -y curl php php-mysql mariadb-client php-fpm
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/

COPY ./tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

COPY ./conf/default.conf /etc/php/7.3/fpm/pool.d

EXPOSE 9000

CMD [ "setup.sh" ]