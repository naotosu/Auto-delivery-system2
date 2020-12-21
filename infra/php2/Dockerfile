FROM php:7.4-fpm-buster
SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

ENV COMPOSER_ALLOW_SUPERUSER=1 \
  COMPOSER_HOME=/composer

ENV PHP_INI_DIR /usr/local/etc/php

COPY --from=composer:1.10 /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
  apt-get -y install git unzip libzip-dev libicu-dev libonig-dev vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  docker-php-ext-install intl pdo_mysql zip bcmath

RUN mkdir /var/run/php-fpm && \
    chmod 776 /var/run/php-fpm

COPY ./infra/php2/php-fpm.d/zzz-www.conf /usr/local/etc/php-fpm.d/zzz-www.conf
COPY ./infra/php2/php.ini /usr/local/etc/php/php.ini
COPY laravel/ /work/laravel/

RUN chmod -R 755 /work/laravel
RUN chmod -R 755 /work/laravel/storage
RUN chmod -R 755 /work/laravel/public

WORKDIR /work/laravel