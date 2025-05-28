#!/bin/bash
set -e

# Load secrets (mounted via volume from secrets/)
source /run/secrets/db_credentials.env

# Start MariaDB safely
mysqld_safe &

# Wait a few seconds for MariaDB to come up
sleep 5

# Inject user, database, etc.
bash /tools/inject.sh

# Keep container alive (or replace with proper exec later)
wait
