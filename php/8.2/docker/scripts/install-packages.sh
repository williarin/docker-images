#!/bin/sh
set -ex

apk --no-cache add \
    bash \
    zip unzip \
    icu-libs \
    libavif \
    php82 \
    php82-ctype \
    php82-curl \
    php82-dom \
    php82-ftp \
    php82-gd \
    php82-iconv \
    php82-intl \
    php82-mbstring \
    php82-mysqlnd \
    php82-openssl \
    php82-pdo \
    php82-pdo_sqlite \
    php82-pdo_mysql \
    php82-pdo_pgsql \
    php82-pear \
    php82-phar \
    php82-posix \
    php82-session \
    php82-sqlite3 \
    php82-xml \
    php82-xmlreader \
    php82-zip \
    php82-zlib \
    php82-tokenizer \
    php82-simplexml \
    php82-xmlwriter \
    php82-fileinfo \
    php82-sodium \
    php82-opcache

ln -s /usr/bin/php82 /usr/bin/php
