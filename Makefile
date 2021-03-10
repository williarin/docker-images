.PHONY: all

DOCKER_RUN_TEST_OPTIONS = --user www-data -w /home/www-data --rm

all: php test-php

.PHONY: php php7 php8
php: php7 php8

php7:
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=7.4 --target php -t williarin/php:7.4 php/7.4
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=7.4 --target php-dev -t williarin/php:7.4-dev php/7.4
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=7.4 --target php-fpm -t williarin/php:7.4-fpm php/7.4
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=7.4 --target php-fpm-dev -t williarin/php:7.4-fpm-dev php/7.4

php8:
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=8.0 --target php -t williarin/php:8.0 php/8.0
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=8.0 --target php-dev -t williarin/php:8.0-dev php/8.0
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=8.0 --target php-fpm -t williarin/php:8.0-fpm php/8.0
	docker build --build-arg ALPINE_VERSION=3.13 --build-arg PHP_VERSION=8.0 --target php-fpm-dev -t williarin/php:8.0-fpm-dev php/8.0

.PHONY: test-php test-php7 test-php8
test-php: test-php7 test-php8

test-php7:
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:7.4 bash -c "php -v | grep '7\.4'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:7.4-dev bash -c "php -v | grep '7\.4' && php -v | grep 'Xdebug v3'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:7.4-fpm bash -c "php -v | grep '7\.4'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:7.4-fpm-dev bash -c "php -v | grep '7\.4' && php -v | grep 'Xdebug v3'"

test-php8:
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0 bash -c "php -v | grep '8\.0'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-dev bash -c "php -v | grep '8\.0' && php -v | grep 'Xdebug v3'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-fpm bash -c "php -v | grep '8\.0'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-fpm-dev bash -c "php -v | grep '8\.0' && php -v | grep 'Xdebug v3'"

.PHONY: deploy deploy7 deploy8
deploy: deploy7 deploy8

deploy7:
	docker push williarin/php:7.4
	docker push williarin/php:7.4-dev
	docker push williarin/php:7.4-fpm
	docker push williarin/php:7.4-fpm-dev

deploy8:
	docker push williarin/php:8.0
	docker push williarin/php:8.0-dev
	docker push williarin/php:8.0-fpm
	docker push williarin/php:8.0-fpm-dev
