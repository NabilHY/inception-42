#!/bin/sh

echo "NGINX"

exec nginx -g 'daemon off;'

wait

# nginx -V 2>&1 | awk -F: '/configure arguments/ {print $2}' | xargs -n1