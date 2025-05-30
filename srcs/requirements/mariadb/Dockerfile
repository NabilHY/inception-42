FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /docker-entrypoint-initdb.d

# RUN . /run/secrets/db_credentials.env

COPY ./tools/inject.sh /tools/inject.sh

COPY ./tools/entrypoint.sh /tools/entrypoint.sh

COPY ./db-init/init.sql /docker-entrypoint-initdb.d/init.sql

RUN chmod +x /tools/entrypoint.sh

RUN chmod +x /tools/inject.sh

EXPOSE 3306

CMD ["mysqld_safe"]