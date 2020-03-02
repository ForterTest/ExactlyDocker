FROM php:7.4-fpm
RUN apt-get update && apt-get install -y libpq-dev zlib1g-dev libicu-dev g++
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

COPY start.sh /usr/local/bin/start
RUN chmod u+x /usr/local/bin/start

CMD ["/usr/local/bin/start"]
