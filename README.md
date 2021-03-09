# Docker images

This repository contains various Docker images to be used in web softwares.

## PHP

This is an adaptation of [kreait/php](https://github.com/kreait/docker-images) repository.

Images are built once a week at 00:00 on Monday.

### Available tags

| Image  | Size |
| --- | --- |
| williarin/php:8.0          | [![](https://img.shields.io/docker/image-size/williarin/php/8.0)](https://hub.docker.com/r/williarin/php)         |
| williarin/php:8.0-dev      | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-dev)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.0-fpm      | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-fpm)](https://hub.docker.com/r/williarin/php)     |
| williarin/php:8.0-fpm-dev  | [![](https://img.shields.io/docker/image-size/williarin/php/8.0-fpm-dev)](https://hub.docker.com/r/williarin/php) |

### Details

All versions come with `opache` and widely used extensions.  
Additionally, `-dev` versions come with Xdebug 3.

### Docker Security

All the images are pre-built with a user `www-data` and a group with the same name. Generally there is no need to run containers with `root` privileges, so we advise the following:

**Specify a --user name and set the working directory on docker runs, e.g.:**

docker run --user www-data -w /home/www-data --rm williarin/php:8.0-dev bash -c "php -v | grep 'Xdebug'"

Confirm it by running:

docker run --user www-data -w /home/www-data --rm williarin/php:8.0-dev bash -c "id ; env" 
