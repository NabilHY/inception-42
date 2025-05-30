#!/bin/bash
set -e

# Start MariaDB safely
mysqld_safe &

# Wait a few seconds for MariaDB to come up
sleep 5

# Inject user, database, etc.
bash /tools/inject.sh

# Keep container alive (or replace with proper exec later)
wait