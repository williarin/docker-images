#!/bin/bash
set -ex

apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ add php81-pecl-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php81/conf.d/50_xdebug.ini
