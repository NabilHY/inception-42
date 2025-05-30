#!/bin/bash
set -e

source /run/secrets/db_credentials.env

echo "Injecting database and user ..."

echo "Secrets loaded:"
echo "MYSQL_DATABASE=$MYSQL_DATABASE"
echo "MYSQL_USER=$MYSQL_USER"
echo "MYSQL_PASSWORD=$MYSQL_PASSWORD"
echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD"


mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
"

echo "DB Injected succesfully"