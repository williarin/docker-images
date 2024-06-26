# Docker images

This repository contains various Docker images to be used in web softwares.

## Alpine Linux for prod and dev

Starting from 3.20, the production image is almost the same as the official alpine. The timezone is set to UTC.

Versions 3.19 (and below) and 3.20-dev include tools to enhance manual interaction inside the container.

![GitHub Logo](/assets/images/exa_demo.jpg)

### Details

Tools included in the dev version (3.19 and below, 3.20-dev and above):

* [zsh](https://www.zsh.org/) with `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins
* [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) with a beautiful prompt
* [exa](https://the.exa.website/) modern replacement for `ls`

Aliases are already defined to replace `ls` with `exa`:

```zsh
alias ls="exa --icons --group-directories-first"
alias l="exa -aaghl --git --icons --group-directories-first"
alias ll="exa -ghl --git --icons --group-directories-first"
alias lt="exa --tree --level=2 --icons --group-directories-first"
```

Try it:

```bash
# Connect as root
docker run --rm -it williarin/alpine:dev

# Connect as current user
docker run --rm -it -u '1000:1000' williarin/alpine:dev
```

### Available tags

| Image  | Size |
| ------ | ---- |
| williarin/alpine:edge   | [![](https://img.shields.io/docker/image-size/williarin/alpine/edge)](https://hub.docker.com/r/williarin/alpine)   |
| williarin/alpine:latest | [![](https://img.shields.io/docker/image-size/williarin/alpine/latest)](https://hub.docker.com/r/williarin/alpine) |
| williarin/alpine:dev | [![](https://img.shields.io/docker/image-size/williarin/alpine/dev)](https://hub.docker.com/r/williarin/alpine) |
| williarin/alpine:3.20   | [![](https://img.shields.io/docker/image-size/williarin/alpine/3.20)](https://hub.docker.com/r/williarin/alpine)   |
| williarin/alpine:3.20-dev   | [![](https://img.shields.io/docker/image-size/williarin/alpine/3.20-dev)](https://hub.docker.com/r/williarin/alpine)   |
| williarin/alpine:3.19   | [![](https://img.shields.io/docker/image-size/williarin/alpine/3.19)](https://hub.docker.com/r/williarin/alpine)   |
| williarin/alpine:3.18 [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/alpine/3.18)](https://hub.docker.com/r/williarin/alpine)   |
| williarin/alpine:3.16 [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/alpine/3.16)](https://hub.docker.com/r/williarin/alpine)   |
| williarin/alpine:3.15 [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/alpine/3.15)](https://hub.docker.com/r/williarin/alpine)   |
| williarin/alpine:3.14 [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/alpine/3.14)](https://hub.docker.com/r/williarin/alpine)   |
| williarin/alpine:3.13 [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/alpine/3.13)](https://hub.docker.com/r/williarin/alpine)   |

_**Note:** `latest` is equivalent to `3.20` and `dev` is equivalent to `3.20-dev`_

## PHP 7.4, 8.0, 8.1, 8.2, 8.3 images

Images are built once a week at 00:00 on Monday.

### Details

All PHP images are based on Alpine Linux 3.20 ([williarin/alpine](#alpine-linux-for-prod-and-dev)). They come with `bash`, `curl`, `zip`, `unzip` and widely used PHP extensions.

Installed PHP extensions:

`json`, `ctype`, `curl`, `dom`, `ftp`, `gd`, `iconv`, `intl`, `mbstring`, `mysqlnd`, `openssl`, `pdo`,
`pdo_sqlite`, `pdo_mysql`, `pdo_pgsql`, `pear`, `phar`, `posix`, `session`, `sqlite3`, `xml`,
`xmlreader`, `zip`, `zlib`, `opcache`, `tokenizer`, `simplexml`, `xmlwriter`, `fileinfo`, `sodium`

Additionally, `-dev` versions come with Xdebug 3, Git and Make.

### Available tags

| Image  | Size |
| --- | --- |
| williarin/php:8.3          | [![](https://img.shields.io/docker/image-size/williarin/php/8.3)](https://hub.docker.com/r/williarin/php)         |
| williarin/php:8.3-dev      | [![](https://img.shields.io/docker/image-size/williarin/php/8.3-dev)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.3-fpm      | [![](https://img.shields.io/docker/image-size/williarin/php/8.3-fpm)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.3-fpm-dev  | [![](https://img.shields.io/docker/image-size/williarin/php/8.3-fpm-dev)](https://hub.docker.com/r/williarin/php) |
| williarin/php:8.2          | [![](https://img.shields.io/docker/image-size/williarin/php/8.2)](https://hub.docker.com/r/williarin/php)         |
| williarin/php:8.2-dev      | [![](https://img.shields.io/docker/image-size/williarin/php/8.2-dev)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.2-fpm      | [![](https://img.shields.io/docker/image-size/williarin/php/8.2-fpm)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.2-fpm-dev  | [![](https://img.shields.io/docker/image-size/williarin/php/8.2-fpm-dev)](https://hub.docker.com/r/williarin/php) |
| williarin/php:8.1          | [![](https://img.shields.io/docker/image-size/williarin/php/8.1)](https://hub.docker.com/r/williarin/php)         |
| williarin/php:8.1-dev      | [![](https://img.shields.io/docker/image-size/williarin/php/8.1-dev)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.1-fpm      | [![](https://img.shields.io/docker/image-size/williarin/php/8.1-fpm)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.1-fpm-dev  | [![](https://img.shields.io/docker/image-size/williarin/php/8.1-fpm-dev)](https://hub.docker.com/r/williarin/php) |
| williarin/php:8.0          | [![](https://img.shields.io/docker/image-size/williarin/php/8.0)](https://hub.docker.com/r/williarin/php)         |
| williarin/php:8.0-dev      | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-dev)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.0-fpm      | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-fpm)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.0-fpm-dev  | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-fpm-dev)](https://hub.docker.com/r/williarin/php) |
| williarin/php:7.4 [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/php/7.4)](https://hub.docker.com/r/williarin/php)         |
| williarin/php:7.4-dev [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/php/7.4-dev)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:7.4-fpm [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/php/7.4-fpm)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:7.4-fpm-dev [deprecated] | [![](https://img.shields.io/docker/image-size/williarin/php/7.4-fpm-dev)](https://hub.docker.com/r/williarin/php) |

### Docker Security

All the images are pre-built with a user `www-data` and a group with the same name. Generally there is no need to run containers with `root` privileges, so we advise the following:

**Specify a --user name and set the working directory on docker runs, e.g.:**

```bash
docker run --user www-data -w /home/www-data --rm williarin/php:8.2-dev bash -c "php -v | grep 'Xdebug'"
```

Confirm it by running:

```bash
docker run --user www-data -w /home/www-data --rm williarin/php:8.2-dev bash -c "id ; env"
```

### Extend the images to your needs

You can easily add PHP extensions using Alpine package manager.

As an example, create a new image with this Dockerfile to add exif extension to PHP:

```dockerfile
FROM williarin/php:8.2-fpm

RUN apk add --no-cache \
        php8-exif \
    ;
```
