#!/bin/sh
set -e

# Install a reliable netcat version if needed
apk add --no-cache netcat-openbsd

# Wait for WordPress FPM to become available
echo "⏳ Waiting for wordpress:9000 to become reachable..."
until nc -z -w5 wordpress 9000; do
    echo "Still waiting for WordPress..."
    sleep 1
done

echo "✅ WordPress is up — starting NGINX..."
exec nginx -g 'daemon off;'