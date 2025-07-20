#!/bin/sh

redis-cli -v

echo "Starting Redis..."

redis-server --protected-mode no &

# Keep the container running
tail -f /dev/null