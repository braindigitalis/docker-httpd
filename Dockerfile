FROM php:8.1-apache-buster

WORKDIR /var/www/html

# Install php extensions required for laravel
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql

# Select development configuration for error logging
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

# Install composer within container
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -q -y unzip default-mysql-client
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN rm composer-setup.php && cp composer.phar /usr/local/bin/composer
