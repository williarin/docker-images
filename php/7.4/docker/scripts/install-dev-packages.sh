#!/bin/bash
set -ex

apk --no-cache add make git php7-pecl-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php7/conf.d/50_xdebug.ini
