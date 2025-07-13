#!/bin/sh
set -e

# Start MariaDB safely
echo "Starting MariaDB..."
mariadbd-safe &

# Wait a few seconds for MariaDB to come up
sleep 5

source /run/secrets/db_credentials

echo "Injecting database and user ..."

mariadb -u root -p"$MYSQL_ROOT_PASSWORD" -e "
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
"

echo "DB Injected succesfully"

# Keep container alive (or replace with proper exec later)
wait