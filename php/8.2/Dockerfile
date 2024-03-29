# Credits to https://github.com/kreait/docker-images

ARG ALPINE_VERSION
ARG REGISTRY

###########################################################

FROM ${REGISTRY}williarin/alpine:${ALPINE_VERSION} as base

ARG ALPINE_VERSION
ARG PHP_VERSION

COPY docker /docker/

RUN apk --update-cache add ca-certificates \
    && apk update && apk upgrade \
    && /docker/scripts/install-packages.sh \
    && /docker/scripts/ensure-www-data.sh \
    && mv /docker/php-entrypoint /usr/local/bin/

ENTRYPOINT ["php-entrypoint"]

CMD ["php", "-a"]

###########################################################

FROM base AS php

RUN rm -rf /docker

###########################################################

FROM base as php-dev

RUN /docker/scripts/install-dev-packages.sh \
    && rm -rf /docker

###########################################################

FROM base AS base-fpm

RUN apk --no-cache add php82-fpm \
    && mv /docker/www.conf /etc/php82/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm82"]

###########################################################

FROM base-fpm as php-fpm

RUN rm -rf /docker

###########################################################

FROM base-fpm as php-fpm-dev

RUN /docker/scripts/install-dev-packages.sh \
    && rm -rf /docker
