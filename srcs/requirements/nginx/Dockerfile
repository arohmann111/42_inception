FROM debian:buster

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=DE/ST=A/L=B/O=C/OU=D/CN=E/emailAddress=arohmann@student.42heilbronn.de"

# ARG NGINX_ROOT_DIR="/var/www"
# # Create Root Directory for NGINX
# RUN mkdir -p ${NGINX_ROOT_DIR}
# Change owner to www-data
# RUN chown -R www-data:www-data ${NGINX_ROOT_DIR}
# # Change user and group to www-data
# RUN chown www-data:www-data ${NGINX_ROOT_DIR}

COPY ./conf/global.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/server.conf
# COPY ./conf/default.conf /etc/nginx/sites-available/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]