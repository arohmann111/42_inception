FROM debian:buster

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=DE/ST=A/L=B/O=C/OU=D/CN=E/emailAddress=arohmann@student.42heilbronn.de"
COPY ./conf/default.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]