FROM debian:buster

RUN sleep 15
# install nginx
RUN apt-get update && apt-get install -y \
	nginx \
	openssl \
	&& rm -rf /var/lib/apt/lists/*
# create key-pair
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=DE/ST=A/L=B/O=C/OU=D/CN=E/emailAddress=arohmann@student.42heilbronn.de"

# copy configs into nginx dir
COPY ./conf/global.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/server.conf

# make port visible
EXPOSE 443

# run nginx
CMD ["nginx", "-g", "daemon off;"]