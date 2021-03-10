# Docker images

This repository contains various Docker images to be used in web softwares.

## PHP 7.4 and 8.0 images

This is an adaptation of [kreait/php](https://github.com/kreait/docker-images) repository.

Images are built once a week at 00:00 on Monday.

### Details

All images are based on Alpine Linux 3.13 and come with `bash`, `zip`, `unzip` and widely
used PHP extensions.  

Installed PHP extensions:

`ctype`, `curl`, `dom`, `ftp`, `gd`, `iconv`, `intl`, `mbstring`, `mysqlnd`, `openssl`, `pdo`,
`pdo_sqlite`, `pdo_mysql`, `pdo_pgsql`, `pear`, `phar`, `posix`, `session`, `sqlite3`, `xml`,
`xmlreader`, `zip`, `zlib`, `opcache`

Additionally, `-dev` versions come with Xdebug 3.

### Available tags

| Image  | Size |
| --- | --- |
| williarin/php:7.4          | [![](https://img.shields.io/docker/image-size/williarin/php/7.4)](https://hub.docker.com/r/williarin/php)         |
| williarin/php:7.4-dev      | [![](https://img.shields.io/docker/image-size/williarin/php/7.4-dev)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:7.4-fpm      | [![](https://img.shields.io/docker/image-size/williarin/php/7.4-fpm)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:7.4-fpm-dev  | [![](https://img.shields.io/docker/image-size/williarin/php/7.4-fpm-dev)](https://hub.docker.com/r/williarin/php) |
| williarin/php:8.0          | [![](https://img.shields.io/docker/image-size/williarin/php/8.0)](https://hub.docker.com/r/williarin/php)         |
| williarin/php:8.0-dev      | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-dev)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.0-fpm      | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-fpm)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.0-fpm-dev  | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-fpm-dev)](https://hub.docker.com/r/williarin/php) |

### Docker Security

All the images are pre-built with a user `www-data` and a group with the same name. Generally there is no need to run containers with `root` privileges, so we advise the following:

**Specify a --user name and set the working directory on docker runs, e.g.:**

```bash
docker run --user www-data -w /home/www-data --rm williarin/php:8.0-dev bash -c "php -v | grep 'Xdebug'"
```

Confirm it by running:

```bash
docker run --user www-data -w /home/www-data --rm williarin/php:8.0-dev bash -c "id ; env" 
```

### Extend the images to your needs

