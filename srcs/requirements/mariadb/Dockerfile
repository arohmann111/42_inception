FROM alpine:3.16

#look for updates and installs mariadb
RUN apk update && apk add mariadb
#start command
ENTRYPOINT "setup.sh"
CMD ""
