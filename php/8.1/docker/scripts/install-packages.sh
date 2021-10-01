#!/bin/sh
set -ex

apk --no-cache add \
    bash \
    zip unzip \
    php81 \
    php81-ctype \
    php81-curl \
    php81-dom \
    php81-ftp \
    php81-gd \
    php81-iconv \
    php81-intl \
    php81-mbstring \
    php81-mysqlnd \
    php81-openssl \
    php81-pdo \
    php81-pdo_sqlite \
    php81-pdo_mysql \
    php81-pdo_pgsql \
    php81-pear \
    php81-phar \
    php81-posix \
    php81-session \
    php81-sqlite3 \
    php81-xml \
    php81-xmlreader \
    php81-zip \
    php81-zlib \
    php81-tokenizer \
    php81-simplexml \
    php81-xmlwriter \
    php81-fileinfo \
    php81-sodium \
    php81-opcache

ln -s /usr/bin/php81 /usr/bin/php
