.PHONY: all

DOCKER_RUN_TEST_OPTIONS = --user www-data -w /home/www-data --rm

all: php test-php

.PHONY: php
php:
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=8.0 --target php -t williarin/php:8.0 php/8.0
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=8.0 --target php-dev -t williarin/php:8.0-dev php/8.0
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=8.0 --target php-fpm -t williarin/php:8.0-fpm php/8.0
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=8.0 --target php-fpm-dev -t williarin/php:8.0-fpm-dev php/8.0

.PHONY: test-php
test-php:
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0 bash -c "php -v | grep '8\.0'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-dev bash -c "php -v | grep '8\.0' && php -v | grep 'Xdebug'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-fpm bash -c "php -v | grep '8\.0'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-fpm-dev bash -c "php -v | grep '8\.0' && php -v | grep 'Xdebug'"

.PHONY: deploy
deploy:
	docker push williarin/php:8.0
	docker push williarin/php:8.0-dev
	docker push williarin/php:8.0-fpm
	docker push williarin/php:8.0-fpm-dev
