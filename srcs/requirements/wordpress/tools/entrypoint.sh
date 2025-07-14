#!/bin/bash

set -e

# source /run/secrets/wp_credentials

cat > /var/www/html/wp-config.php <<EOF
<?php
define( 'DB_NAME', '${WORDPRESS_DB_NAME}' );
define( 'DB_USER', '${WORDPRESS_DB_USER}' );
define( 'DB_PASSWORD', '${WORDPRESS_DB_PASSWORD}' );
define( 'DB_HOST', '${WORDPRESS_DB_HOST}' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

\$table_prefix = 'wp_';

define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);

if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', __DIR__ . '/' );
require_once ABSPATH . 'wp-settings.php';
EOF


echo "WordPress configuration file created at /var/www/html/wp-config.php"
cat /var/www/html/wp-config.php

exec "$@"