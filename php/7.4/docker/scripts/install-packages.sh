#!/bin/sh
set -ex

apk --no-cache add \
    bash \
    curl \
    zip unzip;

apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.15/main add 'icu-libs==69.1-r1';

apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.15/community add \
    php7 \
    php7-json \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-ftp \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-mbstring \
    php7-mysqlnd \
    php7-openssl \
    php7-pdo \
    php7-pdo_sqlite \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pear \
    php7-phar \
    php7-posix \
    php7-session \
    php7-sqlite3 \
    php7-xml \
    php7-xmlreader \
    php7-zip \
    php7-zlib \
    php7-tokenizer \
    php7-simplexml \
    php7-xmlwriter \
    php7-fileinfo \
    php7-sodium \
    php7-opcache
