FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

#look for updates and installs mariadb
RUN apt-get update
RUN apt-get install -y --quiet --no-install-recommends --no-install-suggests\
		mariadb-server
RUN apt-get install -y dumb-init
#start command
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
#expose port to outside
EXPOSE 3306
#cope files to container
COPY ./tools/50-setup.sh /usr/bin/50-setup.sh
RUN chmod +x /usr/bin/50-setup.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#arguments for the entrypoint
CMD [ "50-setup.sh", "mysqld_safe" ]
# CMD [ "bash", "-c", "bash" ]
