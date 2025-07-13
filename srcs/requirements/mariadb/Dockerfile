FROM alpine:latest

RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-openrc \
    && mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql


COPY tools/entrypoint.sh /tools/entrypoint.sh

RUN chmod +x /tools/entrypoint.sh