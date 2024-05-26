#!/bin/bash
set -ex

apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.19/community add make git php81-pecl-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php81/conf.d/50_xdebug.ini
