#!/bin/bash
set -ex

apk --no-cache add make git php8-pecl-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php8/conf.d/50_xdebug.ini
