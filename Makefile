.PHONY: all

DOCKER_RUN_TEST_OPTIONS = --user www-data -w /home/www-data --rm

all: alpine test-alpine php test-php

.PHONY: alpine alpine313 alpine314 alpine315 alpineedge
alpine: alpine313 alpine314 alpine315 alpineedge

alpine313:
	docker build --no-cache -t williarin/alpine:3.13 alpine/3.13

alpine314:
	docker build --no-cache -t williarin/alpine:3.14 alpine/3.14

alpine315:
	docker build --no-cache -t williarin/alpine:3.15 -t williarin/alpine:latest alpine/3.15

alpineedge:
	docker build --no-cache -t williarin/alpine:edge alpine/edge

.PHONY: test-alpine test-alpine313 test-alpine314 test-alpine315 test-alpineedge
test-alpine: test-alpine313 test-alpine314 test-alpine315 test-alpineedge

test-alpine313:
	docker run --rm williarin/alpine:3.13 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm williarin/alpine:3.13 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.13'"

test-alpine314:
	docker run --rm williarin/alpine:3.14 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm williarin/alpine:3.14 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.14'"

test-alpine315:
	docker run --rm williarin/alpine:3.15 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm williarin/alpine:3.15 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.15'"

test-alpineedge:
	docker run --rm williarin/alpine:edge /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm williarin/alpine:edge /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux edge'"

.PHONY: php php7 php8 php81
php: php7 php8 php81

php7:
	docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=7.4 --target php -t williarin/php:7.4 php/7.4
	docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=7.4 --target php-dev -t williarin/php:7.4-dev php/7.4
	docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=7.4 --target php-fpm -t williarin/php:7.4-fpm php/7.4
	docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=7.4 --target php-fpm-dev -t williarin/php:7.4-fpm-dev php/7.4

php8:
	docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=8.0 --target php -t williarin/php:8.0 php/8.0
	docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=8.0 --target php-dev -t williarin/php:8.0-dev php/8.0
	docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=8.0 --target php-fpm -t williarin/php:8.0-fpm php/8.0
	docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=8.0 --target php-fpm-dev -t williarin/php:8.0-fpm-dev php/8.0

php81:
	docker build --build-arg ALPINE_VERSION=edge --build-arg PHP_VERSION=8.1 --target php -t williarin/php:8.1 php/8.1
	docker build --build-arg ALPINE_VERSION=edge --build-arg PHP_VERSION=8.1 --target php-dev -t williarin/php:8.1-dev php/8.1
	docker build --build-arg ALPINE_VERSION=edge --build-arg PHP_VERSION=8.1 --target php-fpm -t williarin/php:8.1-fpm php/8.1
	docker build --build-arg ALPINE_VERSION=edge --build-arg PHP_VERSION=8.1 --target php-fpm-dev -t williarin/php:8.1-fpm-dev php/8.1

.PHONY: test-php test-php7 test-php8 test-php81
test-php: test-php7 test-php8 test-php81

test-php7:
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:7.4 bash -c "php -v | grep '7\.4'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:7.4-dev bash -c "php -v | grep '7\.4' && php -v | grep 'Xdebug v3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:7.4-fpm bash -c "php -v | grep '7\.4'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:7.4-fpm-dev bash -c "php -v | grep '7\.4' && php -v | grep 'Xdebug v3'"

test-php8:
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0 bash -c "php -v | grep '8\.0'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-dev bash -c "php -v | grep '8\.0' && php -v | grep 'Xdebug v3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-fpm bash -c "php -v | grep '8\.0'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.0-fpm-dev bash -c "php -v | grep '8\.0' && php -v | grep 'Xdebug v3'"

test-php81:
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.1 bash -c "php -v | grep '8\.1'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.1-dev bash -c "php -v | grep '8\.1' && php -v | grep 'Xdebug v3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.1-fpm bash -c "php -v | grep '8\.1'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) williarin/php:8.1-fpm-dev bash -c "php -v | grep '8\.1' && php -v | grep 'Xdebug v3'"

.PHONY: deploy deploy7 deploy8 deploy81
deploy: deploy-alpine deploy7 deploy8 deploy81

deploy-alpine:
	docker push williarin/alpine:3.13
	docker push williarin/alpine:3.14
	docker push williarin/alpine:3.15
	docker push williarin/alpine:latest
	docker push williarin/alpine:edge

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

deploy81:
	docker push williarin/php:8.1
	docker push williarin/php:8.1-dev
	docker push williarin/php:8.1-fpm
	docker push williarin/php:8.1-fpm-dev
