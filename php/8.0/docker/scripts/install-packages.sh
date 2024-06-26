#!/bin/sh
set -ex

apk --no-cache add \
    bash \
    curl \
    zip unzip;

apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.16/main add 'icu-libs==71.1-r2';

apk --no-cache \
    --repository=https://dl-cdn.alpinelinux.org/alpine/v3.16/community \
    --repository=https://dl-cdn.alpinelinux.org/alpine/v3.16/main \
    add \
    php8 \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-ftp \
    php8-gd \
    php8-iconv \
    php8-intl \
    php8-mbstring \
    php8-mysqlnd \
    php8-openssl \
    php8-pdo \
    php8-pdo_sqlite \
    php8-pdo_mysql \
    php8-pdo_pgsql \
    php8-pear \
    php8-phar \
    php8-posix \
    php8-session \
    php8-sqlite3 \
    php8-xml \
    php8-xmlreader \
    php8-zip \
    php8-zlib \
    php8-tokenizer \
    php8-simplexml \
    php8-xmlwriter \
    php8-fileinfo \
    php8-sodium \
    php8-opcache

rm -f /usr/bin/php
ln -s /usr/bin/php8 /usr/bin/php
