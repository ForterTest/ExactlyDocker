#!/bin/bash

set -e

role=${CONTAINER_ROLE:-app}

if [ "$role" = "app" ]; then
  exec /usr/local/sbin/php-fpm
elif [ "$role" = "scheduler" ]; then
  while [ true ]
  do
    php /usr/share/nginx/html/artisan schedule:run --verbose --no-interaction &
    sleep 60
  done
fi
