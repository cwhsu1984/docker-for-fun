FROM php:7.2-fpm
RUN apt-get update \
    && apt-get install -y mysql-client \
    && docker-php-ext-install pdo_mysql
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis
