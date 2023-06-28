#!/bin/bash
set -ex

apk --no-cache add make git
apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing add php83-pecl-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php83/conf.d/50_xdebug.ini
