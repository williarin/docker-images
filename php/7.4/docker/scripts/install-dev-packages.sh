#!/bin/bash
set -ex

apk --no-cache add make git
apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.15/community add php7-pecl-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php7/conf.d/50_xdebug.ini
