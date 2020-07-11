FROM php:7.4.5-fpm-alpine

WORKDIR /var/www/html

RUN apk update apk add --no-cache \
    curl \
    vim \
    wget \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libonig-dev

RUN set -ex \
    && apk --no-cache add \
    postgresql-dev

RUN  docker-php-ext-install \ 
     pdo \ 
     pdo_pgsql \
  && apk --no-cache add pcre-dev ${PHPIZE_DEPS} \ 
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && apk del pcre-dev ${PHPIZE_DEPS}