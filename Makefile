LOCAL ?= 0
DEPLOY ?= 0
BUILDX = buildx
PLATFORM = --platform=linux/amd64,linux/arm64,linux/arm/v7
REGISTRY = localhost:5000/
PUSH = --push

ifeq ($(DEPLOY),1)
	REGISTRY =
endif

ifeq ($(LOCAL),1)
	PUSH =
	REGISTRY =
	BUILDX =
	PLATFORM =
endif

DOCKER_RUN_TEST_OPTIONS = --user www-data -w /home/www-data --rm

.PHONY: all
all: alpine test-alpine php test-php

.PHONY: deploy
deploy: alpine php

.PHONY: alpine alpine313 alpine314 alpine315 alpine316 alpine318 alpine319 alpineedge
alpine: alpine318 alpine319 alpineedge

alpine313:
	docker $(BUILDX) build $(PUSH) --no-cache $(PLATFORM) -t $(REGISTRY)williarin/alpine:3.13 alpine/3.13

alpine314:
	docker $(BUILDX) build $(PUSH) --no-cache $(PLATFORM) -t $(REGISTRY)williarin/alpine:3.14 alpine/3.14

alpine315:
	docker $(BUILDX) build $(PUSH) --no-cache $(PLATFORM) -t $(REGISTRY)williarin/alpine:3.15 alpine/3.15

alpine316:
	docker $(BUILDX) build $(PUSH) --no-cache $(PLATFORM) -t $(REGISTRY)williarin/alpine:3.16 alpine/3.16

alpine318:
	docker $(BUILDX) build $(PUSH) --no-cache $(PLATFORM) -t $(REGISTRY)williarin/alpine:3.18 alpine/3.18

alpine319:
	docker $(BUILDX) build $(PUSH) --no-cache $(PLATFORM) -t $(REGISTRY)williarin/alpine:3.19 -t $(REGISTRY)williarin/alpine:latest alpine/3.19

alpineedge:
	docker $(BUILDX) build $(PUSH) --no-cache $(PLATFORM) -t $(REGISTRY)williarin/alpine:edge alpine/edge

.PHONY: test-alpine test-alpine313 test-alpine314 test-alpine315 test-alpine316 test-alpine318 test-alpineedge
test-alpine: test-alpine318 test-alpineedge

test-alpine313:
	docker run --rm $(REGISTRY)williarin/alpine:3.13 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm $(REGISTRY)williarin/alpine:3.13 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.13'"

test-alpine314:
	docker run --rm $(REGISTRY)williarin/alpine:3.14 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm $(REGISTRY)williarin/alpine:3.14 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.14'"

test-alpine315:
	docker run --rm $(REGISTRY)williarin/alpine:3.15 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm $(REGISTRY)williarin/alpine:3.15 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.15'"

test-alpine316:
	docker run --rm $(REGISTRY)williarin/alpine:3.16 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm $(REGISTRY)williarin/alpine:3.16 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.16'"

test-alpine318:
	docker run --rm $(REGISTRY)williarin/alpine:3.18 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm $(REGISTRY)williarin/alpine:3.18 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.18'"

test-alpine319:
	docker run --rm $(REGISTRY)williarin/alpine:3.19 /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm $(REGISTRY)williarin/alpine:3.19 /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux v3.19'"

test-alpineedge:
	docker run --rm $(REGISTRY)williarin/alpine:edge /bin/sh -c "zsh --version | grep -e '^zsh [0-9]\.[0-9]'"
	docker run --rm $(REGISTRY)williarin/alpine:edge /bin/sh -c "cat /etc/os-release | grep -e 'Alpine Linux edge'"

.PHONY: php php7 php8 php81 php82 php83
php: php8 php81 php82 php83

php7:
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=7.4 --target php -t $(REGISTRY)williarin/php:7.4 php/7.4
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=7.4 --target php-dev -t $(REGISTRY)williarin/php:7.4-dev php/7.4
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=7.4 --target php-fpm -t $(REGISTRY)williarin/php:7.4-fpm php/7.4
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=7.4 --target php-fpm-dev -t $(REGISTRY)williarin/php:7.4-fpm-dev php/7.4

php8:
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.0 --target php -t $(REGISTRY)williarin/php:8.0 php/8.0
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.0 --target php-dev -t $(REGISTRY)williarin/php:8.0-dev php/8.0
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.0 --target php-fpm -t $(REGISTRY)williarin/php:8.0-fpm php/8.0
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.0 --target php-fpm-dev -t $(REGISTRY)williarin/php:8.0-fpm-dev php/8.0

php81:
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.1 --target php -t $(REGISTRY)williarin/php:8.1 php/8.1
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.1 --target php-dev -t $(REGISTRY)williarin/php:8.1-dev php/8.1
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.1 --target php-fpm -t $(REGISTRY)williarin/php:8.1-fpm php/8.1
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.1 --target php-fpm-dev -t $(REGISTRY)williarin/php:8.1-fpm-dev php/8.1

php82:
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.2 --target php -t $(REGISTRY)williarin/php:8.2 php/8.2
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.2 --target php-dev -t $(REGISTRY)williarin/php:8.2-dev php/8.2
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.2 --target php-fpm -t $(REGISTRY)williarin/php:8.2-fpm php/8.2
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.2 --target php-fpm-dev -t $(REGISTRY)williarin/php:8.2-fpm-dev php/8.2

php83:
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.3 --target php -t $(REGISTRY)williarin/php:8.3 php/8.3
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.3 --target php-dev -t $(REGISTRY)williarin/php:8.3-dev php/8.3
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.3 --target php-fpm -t $(REGISTRY)williarin/php:8.3-fpm php/8.3
	docker $(BUILDX) build $(PUSH) $(PLATFORM) --build-arg REGISTRY=$(REGISTRY) --build-arg ALPINE_VERSION=latest --build-arg PHP_VERSION=8.3 --target php-fpm-dev -t $(REGISTRY)williarin/php:8.3-fpm-dev php/8.3

.PHONY: test-php test-php7 test-php8 test-php81 test-php82 test-php83
test-php: test-php8 test-php81 test-php82 test-php83

test-php7:
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:7.4 bash -c "php -v | grep '7\.4'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:7.4-dev bash -c "php -v | grep '7\.4' && php -v | grep 'Xdebug v3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:7.4-fpm bash -c "php -v | grep '7\.4'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:7.4-fpm-dev bash -c "php -v | grep '7\.4' && php -v | grep 'Xdebug v3'"

test-php8:
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.0 bash -c "php -v | grep '8\.0'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.0-dev bash -c "php -v | grep '8\.0' && php -v | grep 'Xdebug v3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.0-fpm bash -c "php -v | grep '8\.0'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.0-fpm-dev bash -c "php -v | grep '8\.0' && php -v | grep 'Xdebug v3'"

test-php81:
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.1 bash -c "php -v | grep '8\.1'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.1-dev bash -c "php -v | grep '8\.1' && php -v | grep 'Xdebug v3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.1-fpm bash -c "php -v | grep '8\.1'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.1-fpm-dev bash -c "php -v | grep '8\.1' && php -v | grep 'Xdebug v3'"

test-php82:
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.2 bash -c "php -v | grep '8\.2'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.2-dev bash -c "php -v | grep '8\.2' && php -v | grep 'Xdebug v3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.2-fpm bash -c "php -v | grep '8\.2'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.2-fpm-dev bash -c "php -v | grep '8\.2' && php -v | grep 'Xdebug v3'"

test-php83:
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.3 bash -c "php -v | grep '8\.3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.3-dev bash -c "php -v | grep '8\.3' && php -v | grep 'Xdebug v3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.3-fpm bash -c "php -v | grep '8\.3'"
	docker run $(DOCKER_RUN_TEST_OPTIONS) $(REGISTRY)williarin/php:8.3-fpm-dev bash -c "php -v | grep '8\.3' && php -v | grep 'Xdebug v3'"
