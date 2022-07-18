#!/bin/bash
set -ex

apk --no-cache add make php82-pecl-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php82/conf.d/50_xdebug.ini
