#!/bin/bash
set -ex

apk --no-cache add make git
apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.16/community add php8-pecl-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php8/conf.d/50_xdebug.ini
