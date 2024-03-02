#!/bin/sh
set -ex

apk --no-cache add \
    bash \
    zip unzip \

apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main add libavif icu-libs libsodium

apk --no-cache \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main \
    add \
    php83 \
    php83-ctype \
    php83-curl \
    php83-dom \
    php83-ftp \
    php83-gd \
    php83-iconv \
    php83-intl \
    php83-mbstring \
    php83-mysqlnd \
    php83-openssl \
    php83-pdo \
    php83-pdo_sqlite \
    php83-pdo_mysql \
    php83-pdo_pgsql \
    php83-pear \
    php83-phar \
    php83-posix \
    php83-session \
    php83-sqlite3 \
    php83-xml \
    php83-xmlreader \
    php83-zip \
    php83-zlib \
    php83-tokenizer \
    php83-simplexml \
    php83-xmlwriter \
    php83-fileinfo \
    php83-sodium \
    php83-opcache

rm -f /usr/bin/php
ln -s /usr/bin/php83 /usr/bin/php
